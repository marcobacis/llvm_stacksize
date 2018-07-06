/**
 * Helper class for the liveness computation pass.
 * Enumerates all the values found in the analyzed function.
 *
 * @authors Stefano Cherubin
 */

#ifndef LLVM_LIB_ANALYSIS_VALUE_SHORT_ENUMERATOR_H
#define LLVM_LIB_ANALYSIS_VALUE_SHORT_ENUMERATOR_H

#include "llvm/ADT/DenseMap.h"
#include "llvm/IR/Value.h"
#include <vector>
#include <map>

namespace llvm {

class ValueShortEnumerator {

private:
  uint64_t numberOfValues;
  std::map<Value*, uint64_t> mapID;
  std::vector<Value*> valueVector;

  uint64_t insertNew(Value* v);

public:

  ValueShortEnumerator();

  ValueShortEnumerator(const ValueShortEnumerator& rhs);

  ValueShortEnumerator& operator=(const ValueShortEnumerator& rhs);

  uint64_t maxID() const { return std::max((int) numberOfValues - 1, 0); }

  uint64_t size() const { return numberOfValues; }

  uint64_t toID(Value* v);

  Value* toValue(uint64_t id) const;

};
}

#endif
