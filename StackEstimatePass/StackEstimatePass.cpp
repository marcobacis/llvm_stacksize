/**
 * Stack Estimation main pass
 *
 * @authors Marco Bacis, Maddalena Beccari
 */

#include "StackEstimatePass.h"

using namespace llvm;
using namespace std;
using namespace stackest;

StackEstimatePass::StackEstimatePass() : ModulePass(ID) {}

bool StackEstimatePass::runOnModule(Module &M) {
    llvm::errs() << "In module:" << M.getName() << "\n";

    auto *cg = new CallGraph(M);

    map<string, bool> visited;

    //represents the currently on stack functions
    //(functions on the path from  root to current)
    map<string, bool> onstack;

    stack<string> callstack;

    //TODO fix this, either by finding it or allowing more roots
    StringRef rootname = "main";

    callstack.push(rootname);

    // Performs a iterative post-order DFS with recursion identification

    while(!callstack.empty()) {

        string current = callstack.top();

        CallGraphNode *cgn = cg->operator[](M.getFunction(current));

        if (!onstack[current] && !visited[current]) {

            onstack[current] = true;

            dbgs() << "Adding children of " << current << "\n";

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
            dbgs() << "Calling framesize on " << current << "\n";

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

    dbgs() << "Finished\n";

    for(Function &F : M) {
        dbgs() << F.getName() << " size min " << estimates[F.getName()].best << " max " << estimates[F.getName()].worst << "\n";
    }

    return false;
}

estimate_t StackEstimatePass::valsize(Value *V) {
    unsigned int smin = 0;
    unsigned int smax = 0;

    unsigned int size = V->getType()->getPrimitiveSizeInBits();

    auto valtype = V->getType();

    if(auto arrtype = dyn_cast<ArrayType>(valtype)) {
        unsigned int elemsize = arrtype->getArrayElementType()->getPrimitiveSizeInBits();
        unsigned int arrnum = arrtype->getArrayNumElements();
        size = elemsize * arrnum;
    }

    //TODO get exact min/max alignments (from instruction or as external params?)
    smin = size / 8;// + AI->getAlignment()) / 8;
    smax = size / 8;// + AI->getAlignment()) / 8;

    return {smin,smax};
}

estimate_t StackEstimatePass::framesize(Function *F) {

    estimate_t salloca(0,0);
    estimate_t sf(0,0);

    for (BasicBlock &BB : *F) {

        estimate_t sb(0,0);

        for (Instruction &I : BB) {

            if (isa<AllocaInst>(I)) {
                estimate_t s = valsize(I.getOperand(0));
                salloca += s;
            }

            // Value *[] live = livevars(I)
            // Value *[] allocated = regallocation(live)

            //TODO change this when live/reg values are available
            vector<Value *> live;
            for(unsigned int i = 0; i < I.getNumOperands(); i++) {
                live.push_back(I.getOperand(i));
            }
            vector<Value *> allocated;

            estimate_t current(0,0);

            for(auto lval : live) {
                current.best += valsize(lval).best;
                current.worst += valsize(lval).best;
            }

            for(auto rval : allocated) {
                current.best -= valsize(rval).worst;
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

char stackest::StackEstimatePass::ID = 0;
static RegisterPass<stackest::StackEstimatePass> X("stackest", "Stack Estimation Pass", false, false);

