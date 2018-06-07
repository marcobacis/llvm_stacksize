/**
 * Stack Estimation main pass header
 *
 * @authors Marco Bacis, Maddalena Beccari
 */

#ifndef STACKSIZE_STACKESTIMATE_H
#define STACKSIZE_STACKESTIMATE_H

#define DEBUG_TYPE "stackest"

#include <iostream>
#include <utility>
#include <set>
#include <map>
#include <stack>
#include <string>

#include "LLvm/Pass.h"
#include "LLvm/IR/Module.h"
#include "LLvm/IR/Function.h"
#include "LLvm/IR/InstIterator.h"
#include "LLvm/IR/Instructions.h"
#include "LLvm/IR/Constants.h"
#include "LLvm/IR/Value.h"
#include "LLvm/IR/DerivedTypes.h"
#include "LLvm/Support/raw_ostream.h"
#include "LLvm/ADT/Statistic.h"
#include "LLvm/Analysis/CallGraph.h"
#include "LLvm/Support/Error.h"

using namespace llvm;
using namespace std;

STATISTIC(MaxStackSize, "pessimistic estimate of the stack size");
STATISTIC(MinStackSize, "optimistic estimate of the stack size");

typedef pair<unsigned int, unsigned int> estimate_t;


namespace stackest{

    /**
     * @class StackEstimate
     * @author Marco Bacis, Maddalena Beccari
     * @file StackEstimate.h
     * @brief StackEstimate pass. Processes the given IR and
     * estimates the (worst, best) stack size.
     */
    class StackEstimatePass : public ModulePass {


    public:

        static char ID;

        StackEstimatePass();

        bool runOnModule(Module &M) override;

        void getAnalysisUsage(AnalysisUsage &AU);

    private:

        map<string, estimate_t > estimates;

        estimate_t framesize(Function *F);

        estimate_t instsize(Instruction &I);

    };
}


#endif //STACKSIZE_STACKESTIMATE_H
