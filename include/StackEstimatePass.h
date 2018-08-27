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
#include <cmath>

#include "estimate.h"
#include "RegisterAllocation.h"

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

namespace stackest {

    /**
     * @class StackEstimate
     * @author Marco Bacis, Maddalena Beccari
     * @file StackEstimate.h
     * @brief StackEstimate pass. Processes the given IR and
     * estimates the (worst, best) stack size.
     */
    class StackEstimatePass : public ModulePass {


    public:

        char ID = 0;

        StackEstimatePass(RegisterAllocation *alloc);

        bool runOnModule(Module &M) override;

        void getAnalysisUsage(AnalysisUsage &AU);

    private:

        RegisterAllocation *regalloc;

        /**
         * Contains the estimates (best, worst) of the frame size of  each function
         * referenced in the CallGraph of the module.
         */
        map<string, estimate_t> estimates;

        /**
         * Compute the estimated frame size of the given function
         * @param F function to estimate the frame size
         * @return the estimate (best,worst) of stack allocation from the function
         */
        estimate_t framesize(Function *F);

        /**
         * Computes the estimated size of a value
         * @param V pointer to the value considered
         * @return the estimated size (best,worst) of the value (in bytes)
         */
        estimate_t valsize(Value *V);

    };

    StackEstimatePass *createStackEstimatePass(RegisterAllocation *alloc);
}


#endif //STACKSIZE_STACKESTIMATE_H
