
#include <iostream>
#include "ValueShortEnumerator.h"

using namespace llvm;

// private:
uint64_t ValueShortEnumerator::insertNew(Value* v) {
    mapID[v] = numberOfValues;
    valueVector.push_back(v);
    numberOfValues++;
    return numberOfValues - 1;
}

// public:
ValueShortEnumerator::ValueShortEnumerator() {
    numberOfValues = 0;
}

ValueShortEnumerator::ValueShortEnumerator(const ValueShortEnumerator& rhs) {
    mapID = rhs.mapID;
    valueVector = rhs.valueVector;
    numberOfValues = rhs.numberOfValues;
}

ValueShortEnumerator& ValueShortEnumerator::operator=(const ValueShortEnumerator& rhs) {
    mapID = rhs.mapID;
    valueVector = rhs.valueVector;
    numberOfValues = rhs.numberOfValues;
    return *this;
}

uint64_t ValueShortEnumerator::toID(Value* v) {
    auto i = mapID.find(v);
    if (i != mapID.end()) {
        return i->second;
    }
    return insertNew(v);
}

Value* ValueShortEnumerator::toValue(uint64_t id) const {
    if (id >= numberOfValues) {
        return nullptr;
    }
    return valueVector[id];
}
