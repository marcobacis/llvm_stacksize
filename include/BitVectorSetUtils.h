#ifndef LLVM_LIB_ANALYSIS_BIT_VECTOR_UTILS_H
#define LLVM_LIB_ANALYSIS_BIT_VECTOR_UTILS_H

#include "LLvm/ADT/BitVector.h"
#include "LLvm/ADT/DenseSet.h"
#include "ValueShortEnumerator.h"

namespace llvm {

    BitVector& set_difference(BitVector& lhs, const BitVector& rhs, const ValueShortEnumerator& vse);

    BitVector& set_union(BitVector& lhs, const BitVector& rhs, const ValueShortEnumerator& vse);

    BitVector& set_intersection(BitVector& lhs, const BitVector& rhs, const ValueShortEnumerator& vse);

    DenseSet<Value*> toSet(const BitVector& bv, const ValueShortEnumerator& vse);

} // end namespace

#endif
