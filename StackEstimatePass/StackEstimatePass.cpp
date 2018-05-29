/**
 * Stack Estimation main pass
 *
 * @authors Marco Bacis, Maddalena Beccari
 */



#include "StackEstimatePass.h"

using namespace llvm;
using namespace stackest;

StackEstimatePass::StackEstimatePass() : ModulePass(ID) {}

bool StackEstimatePass::runOnModule(Module &M) {
    llvm::errs() << "In module:" << M.getName() << "\n";
    return false;
}

void StackEstimatePass::getAnalysisUsage(AnalysisUsage &AU) {
    AU.setPreservesAll();
}

char stackest::StackEstimatePass::ID = 0;
static RegisterPass<stackest::StackEstimatePass> X("stackest", "Stack Estimation Pass", false, false);

