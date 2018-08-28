//
// Created by Maddalena Beccari on 20/07/18.
//

#ifndef STACKSIZE_REGISTERALLOCATION_H
#define STACKSIZE_REGISTERALLOCATION_H

#include <fstream>
#include <sstream>

#include "LLvm/IR/Value.h"
#include "LLvm/IR/DataLayout.h"
#include "LLvm/IR/DerivedTypes.h"
#include "LLvm/Support/raw_ostream.h"
#include "LLvm/ADT/Statistic.h"
#include "LLvm/ADT/DenseSet.h"
#include "LLvm/Support/Error.h"

using namespace std;
using namespace llvm;

struct Register {
    int dim;
    bool isEmpty; //all true

    bool operator<(Register other) const {
        return dim < other.dim;
    }

};

class RegisterAllocation {

public:

    RegisterAllocation(StringRef filepath);

    DenseSet<Value *> run(DenseSet<Value *> liveValue);

    int getMinAlignment() { return minAlign; };
    int getMaxAlignment() { return maxAlign; }

    static unsigned int getTypeSize(Type *valtype);

private:
    /** Values vectors used to store the (ordered) live values **/
    vector<Value *> scalars;
    vector<Value *> vectors;
    vector<Value *> structs;
    vector<Value *> arrays;
    vector<Value *> other;

    /** Register file **/
    vector<Register> regInt;
    vector<Register> regFloat;
    vector<Register> regVector;
    vector<Register> regGeneral;

    int minAlign, maxAlign;

    DenseSet<Value *> allocated;

    DenseSet<Value *> valueAllocation();

    void clearRegisterFile();
    void clearRegisterType(vector<Register> &regtype);

    void parseRegisterLine(string &line);
    void instantiateRegisters(int dim, int num, vector<Register> *regbank);

    void divideVariable(DenseSet<Value *> liveValue);


    bool cmpType(Value *i, Value *j);


    bool assign(Type *t, vector<vector<Register> *> &allRegister);

    bool splitValue(Type *t, vector<vector<Register> *> &allRegister);

    bool allocate(Value *value, vector<vector<Register> *> &pref, vector<vector<Register> *> &fallBack);



};

#endif //STACKSIZE_REGISTERALLOCATION_H
