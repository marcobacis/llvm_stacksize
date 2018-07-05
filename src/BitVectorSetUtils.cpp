#include "BitVectorSetUtils.h"

using namespace std;
using namespace llvm;

BitVector &llvm::set_difference(BitVector &lhs, const BitVector &rhs, const ValueShortEnumerator &vse) {
    BitVector tmp = rhs;
    tmp.resize(vse.size());
    tmp.flip();
    lhs.resize(vse.size());
    lhs &= tmp;
    return lhs;
}

BitVector &llvm::set_union(BitVector &lhs, const BitVector &rhs, const ValueShortEnumerator &vse) {
    lhs.resize(vse.size());
    lhs |= rhs;
    return lhs;
}

BitVector &llvm::set_intersection(BitVector &lhs, const BitVector &rhs, const ValueShortEnumerator &vse) {
    lhs.resize(vse.size());
    lhs &= rhs;
    return lhs;
}

DenseSet<Value *> llvm::toSet(const BitVector &bv, const ValueShortEnumerator &vse) {
    DenseSet<Value *> r;
    for (int i = bv.find_first(); i >= 0; i = bv.find_next(i)) {
        r.insert(vse.toValue(i));
    }
    return r;
}

void llvm::printbv(BitVector &bv, const ValueShortEnumerator &vse) {
    DenseSet<Value *> vals = toSet(bv, vse);

    for (auto val = vals.begin(); val != vals.end(); ++val) {
        std::cout << (*val)->getName().str() << " ";
    }
}