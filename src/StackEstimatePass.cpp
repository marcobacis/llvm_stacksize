/**
 * Stack Estimation main pass
 *
 * @authors Marco Bacis, Maddalena Beccari
 */

#include "StackEstimatePass.h"
#include "LiveValues.h"

using namespace llvm;
using namespace std;
using namespace stackest;

StackEstimatePass *stackest::createStackEstimatePass(RegisterAllocation *alloc) {
    return new StackEstimatePass(alloc);
}

StackEstimatePass::StackEstimatePass(RegisterAllocation *alloc) : ModulePass(ID) {
    regalloc = alloc;
}

bool StackEstimatePass::runOnModule(Module &M) {
    //llvm::errs() << "In module:" << M.getName() << "\n";

    auto *cg = new CallGraph(M);

    map<string, bool> visited;

    //represents the currently on stack functions
    //(functions on the path from  root to current)
    map<string, bool> onstack;

    stack<string> callstack;
    vector<Function *> roots;

    //Find "roots" of the callgraph and add them as first nodes to visit.
    // A root should be a node without incoming edges.
    // However, the external calling node is always present.

    auto ext = cg->getExternalCallingNode();

    for(auto cgn = ext->begin(); cgn != ext->end(); ++cgn) {
        if(cgn->second != nullptr && cgn->second->getNumReferences() == 1) {
            callstack.push(cgn->second->getFunction()->getName());
            roots.push_back(cgn->second->getFunction());
        }
    }


    // Performs a iterative post-order DFS with recursion identification

    while(!callstack.empty()) {

        string current = callstack.top();

        CallGraphNode *cgn = cg->operator[](M.getFunction(current));

        if (!onstack[current] && !visited[current]) {

            onstack[current] = true;

            for (auto c = cgn-> begin(); c != cgn->end(); ++c) {
                //if it doesn't call outside of the module
                if(c->second->getFunction() != nullptr) {
                    string name = c->second->getFunction()->getName();
                    if (!visited[name]) {
                        callstack.push(name);
                    }


                    assert(!onstack[name] && "Recursion is not supported.\n");
                }
            }

        } else if(onstack[current]) {

            estimate_t currsize = framesize(M.getFunction(current));
            estimate_t childmax(0,0);

            //gets maximum estimate from children
            for(auto c = cgn->begin(); c != cgn->end(); ++c) {
                if(c->second->getFunction() != nullptr) {
                    estimate_t childest = estimates[c->second->getFunction()->getName()];
                    childmax = max(childmax, childest);
                }
            }

            currsize += childmax;

            estimates[current] = currsize;

            visited[current] = true;
            callstack.pop();
        }
    }

    dbgs() << estimates["main"].worst << "\t" << estimates["main"].best << "\n";

    /*for(Function *F : roots) {
        StringRef name = F->getName();
        dbgs() << M.getName() << " " << name << " size min " << estimates[name].best << " max " << estimates[name].worst << "\n";
    }*/

    return false;
}

estimate_t StackEstimatePass::valsize(Value *V) {
    unsigned int smin = 0;
    unsigned int smax = 0;
    unsigned int minAlign = regalloc->getMinAlignment();
    unsigned int maxAlign = regalloc->getMaxAlignment();

    unsigned int size = ceil(RegisterAllocation::getTypeSize(V->getType()) / 8.0);

    smin = ceil((float)size / minAlign) * minAlign;
    smax = ceil((float)size / maxAlign) * maxAlign;

    return {smin,smax};
}

estimate_t StackEstimatePass::framesize(Function *F) {

    estimate_t salloca(0,0);
    estimate_t sf(0,0);

    LiveValues lives;
    lives.runOnFunction(*F);

    for (BasicBlock &BB : *F) {

        estimate_t sb(0,0);

        for (Instruction &I : BB) {

            if (isa<AllocaInst>(I)) {
                estimate_t s = valsize(I.getOperand(0));
                salloca += s;
            }

            DenseSet<Value *> live = lives.get_instLive(&I);

            DenseSet<Value *> allocated = regalloc->run(live);

            estimate_t current(0,0);

            for(auto lval : live) {
                estimate_t vsize = valsize(lval);
                current.best += vsize.best;
                current.worst += vsize.worst;
            }

            for(auto rval : allocated) {
                unsigned int size = valsize(rval).best;
                current.best -= size;
            }

            sb = max(sb, current);

        }

        sf = max(sf, sb);
    }

    sf += salloca;
    return sf;
}


void StackEstimatePass::getAnalysisUsage(AnalysisUsage &AU) {
    AU.setPreservesAll();
}