/**
 * This file defines the interface for the LLVM IR Value liveness
 * analysis pass.
 *
 * @authors Marco Bacis, Maddalena Beccari
 *
 * Adapted from a old pass written by Stefano Cherubin.
 */

#ifndef LLVM_ANALYSIS_LIVEVALUES_H
#define LLVM_ANALYSIS_LIVEVALUES_H

#include "LLvm/Pass.h"
#include "LLvm/IR/Module.h"
#include "LLvm/IR/ValueMap.h"
#include "LLvm/IR/Value.h"
#include "LLvm/ADT/DenseMap.h"
#include "LLvm/ADT/BitVector.h"
#include "LLvm/IR/Instructions.h"
#include "LLvm/Support/raw_ostream.h"
#include "LLvm/Support/Debug.h"

#include "ValueShortEnumerator.h"
#include "BitVectorSetUtils.h"

#include <queue>
#include <iostream>
#include <map>

using namespace llvm;
using namespace std;

namespace llvm {

    struct LiveValues : public FunctionPass {
        static char ID;

        LiveValues() : FunctionPass(ID) {}

        LiveValues(const llvm::LiveValues & LA) : LiveValues() {
            _bbLiveIn = LA._bbLiveIn;
            _bbLiveOut = LA._bbLiveOut;
            vse = LA.getVSE();
        }

        bool runOnFunction(Function &F) override;

        DenseSet<Value *> get_bbLiveIn(BasicBlock *bb) const;

        BitVector getLiveIn(BasicBlock *bb) const;

        DenseSet<Value *> get_bbLiveOut(BasicBlock *bb) const;

        BitVector getLiveOut(BasicBlock *bb) const;

        void getAnalysisUsage(AnalysisUsage &AU) const override;

        ValueShortEnumerator getVSE() const {return vse; }

    private:

        ValueShortEnumerator vse;

        std::map<BasicBlock*, BitVector> _bbLiveIn;
        std::map<BasicBlock*, BitVector> _bbLiveOut;

        BitVector getDef(const Instruction &instr);

        BitVector getUse(const Instruction &instr);

    };

}

#endif
