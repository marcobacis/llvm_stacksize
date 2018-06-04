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
            //TODO really call framesize and update estimate using children
            dbgs() << "Calling framesize on " << current << "\n";
            visited[current] = true;
            callstack.pop();
        }
    }

    dbgs() << "Finished\n";

    return false;
}

void StackEstimatePass::getAnalysisUsage(AnalysisUsage &AU) {
    AU.setPreservesAll();
}

char stackest::StackEstimatePass::ID = 0;
static RegisterPass<stackest::StackEstimatePass> X("stackest", "Stack Estimation Pass", false, false);

