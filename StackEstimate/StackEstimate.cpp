/**
 * Stack Estimation main pass
 *
 * @authors Marco Bacis, Maddalena Beccari
 */

#define DEBUG_TYPE "stackest"

#include "LLvm/Pass.h"
#include "LLvm/IR/Module.h"
#include "LLvm/IR/Function.h"
#include "LLvm/IR/InstIterator.h"
#include "LLvm/IR/Instructions.h"
#include "LLvm/IR/Value.h"
#include "LLvm/Support/raw_ostream.h"
#include "LLvm/ADT/Statistic.h"

using namespace llvm;

STATISTIC(MaxStackSize, "pessimistic estimate of the stack size");
STATISTIC(MinStackSize, "optimistic estimate of the stack size");

namespace {
    struct StackEstimate : public ModulePass {
        static char ID;
        StackEstimate() : ModulePass(ID) {}

        bool runOnModule(Module &M) override {
            errs() << "In module:" << M.getName() << "\n";
            return false;
        }
    };
}

char StackEstimate::ID = 0;
static RegisterPass<StackEstimate> X("stackest", "Stack Estimation Pass", false, false);