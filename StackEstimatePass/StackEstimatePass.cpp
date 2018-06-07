/**
 * Stack Estimation main pass
 *
 * @authors Marco Bacis, Maddalena Beccari
 */

#include "StackEstimatePass.h"

using namespace llvm;
using namespace stackest;
using namespace std;

StackEstimatePass::StackEstimatePass() : ModulePass(ID) {}

bool StackEstimatePass::runOnModule(Module &M) {
    llvm::errs() << "In module:" << M.getName() << "\n";

    CallGraph *cg = new CallGraph(M);

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

                    if(onstack[name]) {
                        errs() << "Recursion is not supported.\n";
                        //TODO raise llvm error
                        return false;
                    }
                }
            }

        } else if(onstack[current]) {
            dbgs() << "Calling framesize on " << current << "\n";

            estimate_t currsize = framesize(M.getFunction(current));
            estimate_t childmax = make_pair(0,0);

            //gets maximum estimate from children
            for(auto c = cgn->begin(); c != cgn->end(); ++c) {
                if(c->second->getFunction() != nullptr) {
                    estimate_t childest = estimates[c->second->getFunction()->getName()];

                    childmax.first = max(childmax.first, childest.first);
                    childmax.second = max(childmax.second, childest.second);

                }
            }

            currsize.first += childmax.first;
            currsize.second += childmax.second;

            estimates[current] = currsize;

            visited[current] = true;
            callstack.pop();
        }
    }

    dbgs() << "Finished\n";

    for(Function &F : M) {
        dbgs() << F.getName() << " size min " << estimates[F.getName()].first << " max " << estimates[F.getName()].second << "\n";
    }

    return false;
}

estimate_t StackEstimatePass::instsize(Instruction &I) {
    int smin = 0;
    int smax = 0;
    if(auto *AI = dyn_cast<AllocaInst>(&I)) {
        I.dump();

        unsigned int size = AI->getAllocatedType()->getPrimitiveSizeInBits();

        auto allocatype = AI->getAllocatedType();

        if(auto arrtype = dyn_cast<ArrayType>(allocatype)) {
            unsigned int elemsize = arrtype->getArrayElementType()->getPrimitiveSizeInBits();
            unsigned int arrnum = arrtype->getArrayNumElements();
            size = elemsize * arrnum;
        }

        //TODO get exact min/max alignments (from instruction or as external params?)
        smin = (size + AI->getAlignment()) / 8;
        smax = (size + AI->getAlignment()) / 8;
    }

    return make_pair(smin,smax);
}

//TODO Just a skeleton
estimate_t StackEstimatePass::framesize(Function *F) {
    for (BasicBlock &BB : *F) {
        for (Instruction &I : BB) {
            if (isa<AllocaInst>(I)) {
                dbgs() << "\n" << instsize(I).first << " " << instsize(I).second << "\n";
            }
        }
    }

    return make_pair(4,4);
}


void StackEstimatePass::getAnalysisUsage(AnalysisUsage &AU) {
    AU.setPreservesAll();
}

char stackest::StackEstimatePass::ID = 0;
static RegisterPass<stackest::StackEstimatePass> X("stackest", "Stack Estimation Pass", false, false);

