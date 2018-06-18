#include "LiveValues.h"


// #define LLVM_LIVENESS_ANALYSIS_DEBUG
using namespace llvm;
using namespace std;

bool LiveValues::runOnFunction(Function &F) {
    const size_t initial_size = 128;

    DenseMap<BasicBlock*, BitVector> _phiUses;
    DenseMap<BasicBlock*, BitVector> _phiDefs;
    DenseMap<BasicBlock*, BitVector> _uses;
    DenseMap<BasicBlock*, BitVector> _defs;
    DenseMap<BasicBlock*, BitVector> _upExp;

    BitVector _def, _use;
    _def.reserve(initial_size);
    _use.reserve(initial_size);

    std::queue<BasicBlock*> workList;
    PHINode* phin;
    for (auto bb = F.begin(); bb != F.end(); bb++) {
        _def.clear();
        _use.clear();
        _def.reserve(initial_size);
        _use.reserve(initial_size);

        for (auto i_it = bb->begin(); i_it != bb->end(); i_it++) {
            _def = getDef(*i_it);
            if (isa<PHINode>(*i_it)) {
                phin = &cast<PHINode>(*i_it);
                for (uint64_t i = 0; i < phin->getNumIncomingValues(); i++) {
                    uint64_t id = vse.toID(phin->getIncomingValue(i));
                    _phiUses[phin->getIncomingBlock(i)].reserve(vse.size());
                    _phiUses[phin->getIncomingBlock(i)].set(id);
                }

                set_union(_phiDefs[&*bb], _def, vse);
            } else {
                _use = getUse(*i_it);

                set_union(_uses[&*bb], _use, vse);
                set_union(_defs[&*bb], _def, vse);

            }
        } // end for each Instruction

        // Upwards Exposed Values
        _upExp[&*bb] = _use;
        set_difference(_upExp[&*bb], _def, vse);

        workList.push(&*bb);
    }

    while (!workList.empty()) {
        BasicBlock* bb_cur = workList.front();
        BitVector _old_liveIn = _bbLiveIn[bb_cur];
        workList.pop();
        for (auto succ = bb_cur->getNextNode(); succ ; succ = succ->getNextNode()) {
            BitVector _tmp = _bbLiveIn[succ];

            set_difference(_tmp, _phiDefs[succ], vse);
            set_union(_bbLiveOut[bb_cur], _tmp, vse);
        }
        set_union(_bbLiveOut[bb_cur], _phiUses[bb_cur], vse);
        BitVector _tmp = _bbLiveOut[bb_cur];
        set_difference(_tmp, _defs[bb_cur], vse);
        set_union(_bbLiveIn[bb_cur], _tmp, vse);
        set_union(_bbLiveIn[bb_cur], _upExp[bb_cur], vse);
        set_union(_bbLiveIn[bb_cur], _phiDefs[bb_cur], vse);

        if (_bbLiveIn[bb_cur].count() != _old_liveIn.count()) {
            workList.push(bb_cur);
            for (auto pre = bb_cur->getPrevNode(); pre; pre = pre->getPrevNode()) {
                workList.push(pre);
            }
        }
    }
    return false;
}

BitVector LiveValues::getDef(const Instruction &instr) {
    uint64_t id = vse.toID((Value *) &instr);
    BitVector bv(vse.size() + instr.getNumOperands());
    bv.set(id);
    return bv;
}

BitVector LiveValues::getUse(const Instruction &instr) {
    BitVector bv(vse.size() + instr.getNumOperands());
    for (auto op = instr.op_begin(); op != instr.op_end(); ++op) {
        bv.set(vse.toID(op->get()));
    }
    bv.resize(vse.size());
    return bv;
}

DenseSet<Value*> LiveValues::get_bbLiveIn(BasicBlock* bb) const {
    auto r = _bbLiveIn.find(bb);
    if (r != _bbLiveIn.end()) return toSet(r->second, vse);
    return DenseSet<Value*>();
}

BitVector LiveValues::getLiveIn(BasicBlock* bb) const {
    BitVector tmp(vse.size());
    auto r = _bbLiveIn.find(bb);
    if (r != _bbLiveIn.end()) tmp = r->second;
    return tmp;
}

DenseSet<Value*> LiveValues::get_bbLiveOut(BasicBlock* bb) const {
    auto r = _bbLiveOut.find(bb);
    if (r != _bbLiveOut.end()) return toSet(r->second, vse);
    return DenseSet<Value*>();
}

BitVector LiveValues::getLiveOut(BasicBlock* bb) const {
    BitVector tmp(vse.size());
    auto r = _bbLiveOut.find(bb);
    if (r != _bbLiveOut.end()) tmp = r->second;
    return tmp;
}

void LiveValues::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.setPreservesAll();
}


char LiveValues::ID = 0;

static RegisterPass<LiveValues> X("LiveValues",
                                        "Computes Liveness of Values on IR instructions",
                                        true /* Only looks at CFG */,
                                        true /* Analysis Pass */);
