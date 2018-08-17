//
// Created by Maddalena Beccari on 20/07/18.
//

#ifndef STACKSIZE_REGISTERALLOCATION_H
#define STACKSIZE_REGISTERALLOCATION_H

using namespace std;
using namespace llvm;

class RegisterAllocation {
    vector <Value *> scalars;
    vector <Value *> vectors;
    vector <Value *> structs;
    vector <Value *> arrays;
    vector <Value *> other;

    void divideVariable(DenseSet<Value *> liveValue);
    DenseSet<Value*> RegAllocation(DenseSet<Value*> liveValue);

    DataLayout* TD;

    bool cmpType(Value* i, Value* j);

    };

#endif //STACKSIZE_REGISTERALLOCATION_H
