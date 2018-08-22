//
// Created by Maddalena Beccari on 20/07/18.
//

#ifndef STACKSIZE_REGISTERALLOCATION_H
#define STACKSIZE_REGISTERALLOCATION_H

using namespace std;
using namespace llvm;

struct Register{
    int dim;
    bool isEmpty; //all true
};

class RegisterAllocation {
    vector <Value *> scalars;
    vector <Value *> vectors;
    vector <Value *> structs;
    vector <Value *> arrays;
    vector <Value *> other;

    void divideVariable(DenseSet<Value *> liveValue);
    DenseSet<Value*> regAllocation(DenseSet<Value*> liveValue);

    DataLayout* TD;

    bool cmpType(Value* i, Value* j);

    //vectors of registers, reordered by dimentions
    vector<Register> regInt;
    vector<Register> regFloat;
    vector<Register> regVector;
    vector<Register> regGeneral;

    DenseSet<Value*> notInReg;

    bool assign(Type *t, vector<Register> &reg);
    bool splitValue(Type *t, vector<Register> &reg);
    bool allocate(Value* value , vector<Register> pref , vector<Register> fallBack);

};

#endif //STACKSIZE_REGISTERALLOCATION_H