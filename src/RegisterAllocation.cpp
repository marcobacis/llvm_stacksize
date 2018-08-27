//
// Created by Maddalena Beccari on 20/07/18.
//


#include "RegisterAllocation.h"

using namespace llvm;
using namespace std;

RegisterAllocation::RegisterAllocation(StringRef filepath) {

    ifstream regbank(filepath.str());

    string line;

    if (regbank.is_open()) {

        //reads alignments
        regbank >> align;
        getline(regbank, line); //end of first line

        while (getline(regbank, line)) {
            parseRegisterLine(line);
        }
    }


    //sort all the register types
    sort(regInt.begin(), regInt.end());
    sort(regFloat.begin(), regFloat.end());
    sort(regVector.begin(), regVector.end());
    sort(regGeneral.begin(), regGeneral.end());

}

void RegisterAllocation::parseRegisterLine(string &line) {
    stringstream lineStream(line);
    string field;
    string type;

    int dim, num;

    getline(lineStream, type, ',');
    getline(lineStream, field, ',');
    dim = stoi(field);
    getline(lineStream, field, ',');
    num = stoi(field);

    remove_if(type.begin(), type.end(), ::isspace);
    transform(type.begin(), type.end(), type.begin(), ::tolower);

    vector<Register> *toAlloc = &regGeneral;

    if (type == "int")
        toAlloc = &regInt;
    else if (type == "float")
        toAlloc = &regFloat;
    else if (type == "vector")
        toAlloc = &regVector;

    instantiateRegisters(dim, num, toAlloc);

}

void RegisterAllocation::instantiateRegisters(int dim, int num, vector<Register> *regbank) {
    for (int i = 0; i < num; i++) {
        regbank->push_back({dim, true});
    }
}

DenseSet<Value *> RegisterAllocation::run(DenseSet<Value *> liveValue) {
    divideVariable(liveValue);

    DenseSet<Value *> notallocated = valueAllocation();

    clearRegisterFile();

    return allocated;
}


void RegisterAllocation::clearRegisterFile() {
    clearRegisterType(regInt);
    clearRegisterType(regFloat);
    clearRegisterType(regGeneral);
    clearRegisterType(regVector);
}

void RegisterAllocation::clearRegisterType(vector<Register> &regtype) {
    for (Register &reg : regtype) {
        reg.isEmpty = true;
    }
}

//Allocate a value all in the same register
bool RegisterAllocation::assign(Type *t, vector<vector<Register> *> &allRegister) {
    for (int i = 0; i < allRegister.size(); i++) {
        vector<Register> *reg = allRegister[i];
        for (int j = 0; j < reg->size(); j++) {
            if (getTypeSize(t) <= reg->at(j).dim && reg->at(j).isEmpty) {
                reg->at(i).isEmpty = false;
                return true;
            }
        }

    }
    return false;
}

//Allocate a value in more than one register
bool RegisterAllocation::splitValue(Type *t, vector<vector<Register> *> &allRegister) {
    int dimReg;
    int dimValue = getTypeSize(t);
    for (int i = 0; i < allRegister.size(); i++) {
        vector<Register> *reg = allRegister[i];
        for (int j = 0; j < reg->size(); j++) {
            dimReg = 0;
            if (reg->at(j).isEmpty) {
                dimReg = reg->at(j).dim;
                int k = j + 1;
                while (dimValue && reg->at(k).dim == dimReg && k < reg->size()) {
                    dimValue -= dimReg;
                    k++;
                }
                if (dimValue < 0)
                    return true;
            }
        }
        if (dimValue)
            return false;
    }
    return false;
}

//Try to allocate a value in a register
bool  RegisterAllocation::allocate(Value *value, vector<vector<Register> *> &pref, vector<vector<Register> *> &fallBack) {
    Type *type = value->getType();
    if (!assign(type, pref)) {
        if (!assign(type, fallBack)) {
            if (!splitValue(type, pref)) {
                if (!splitValue(type, fallBack)) {
                    return false;
                }
            }
        }
    }
    allocated.insert(value);
    return true;
}

DenseSet<Value *> RegisterAllocation::valueAllocation() {
    vector<vector<Register> *> pref;
    vector<vector<Register> *> fallBack;
    for (int i = 0; i < scalars.size(); i++) {

        if (!scalars[i]->getType()->isIntegerTy()) {
            pref.push_back(&regFloat);
            fallBack.push_back(&regInt);
            fallBack.push_back(&regGeneral);

        } else {
            pref.push_back(&regInt);
            fallBack.push_back(&regGeneral);
        }
        allocate(scalars[i], pref, fallBack);
        pref.clear();
        fallBack.clear();
    }
    for (int i = 0; i < other.size(); i++) {
        fallBack.push_back(&regInt);
        fallBack.push_back(&regGeneral);
        allocate(other[i], pref, fallBack);
        fallBack.clear();
    }
    for (int i = 0; i < vectors.size(); i++) {
        pref.push_back(&regVector);
        fallBack.push_back(&regInt);
        fallBack.push_back(&regGeneral);
        allocate(vectors[i], pref, fallBack);
        pref.clear();
        fallBack.clear();
    }
    for (int i = 0; i < arrays.size(); i++) {
        pref.push_back(&regVector);
        fallBack.push_back(&regInt);
        fallBack.push_back(&regGeneral);
        allocate(arrays[i], pref, fallBack);
        pref.clear();
        fallBack.clear();
    }
    for (int i = 0; i < structs.size(); i++) {
        pref.push_back(&regGeneral);
        fallBack.push_back(&regInt);
        allocate(structs[i], pref, fallBack);
        pref.clear();
        fallBack.clear();
    }

    return allocated;

}

void RegisterAllocation::divideVariable(DenseSet<Value *> liveValue) {

    //Divide the DenseSet in five vectors
    for (Value *v : liveValue) {
        Type *t = v->getType();
        if (t->isIntegerTy() || t->isFloatingPointTy())
            scalars.push_back(v);
        else if (t->isStructTy())
            structs.push_back(v);
        else if (t->isArrayTy())
            arrays.push_back(v);
        else if (t->isVectorTy())
            vectors.push_back(v);
        else
            other.push_back(v);

    }


    //Choose the sort logic
    auto cmpTy = [this](Value *i, Value *j) {
        Type *t1 = i->getType();
        Type *t2 = j->getType();

        switch (t1->getTypeID()) {

            case Type::IntegerTyID:
                //return t1->getIntegerBitWidth() > t2->getIntegerBitWidth();
                // TyL == TyR would have returned true earlier, because types are uniqued.
            case Type::VoidTyID:;
            case Type::FloatTyID:
            case Type::DoubleTyID:
            case Type::X86_FP80TyID:
            case Type::FP128TyID:
            case Type::PPC_FP128TyID:
            case Type::LabelTyID:
            case Type::MetadataTyID:
            case Type::TokenTyID:
                return getTypeSize(t1) > getTypeSize(t2);

            case Type::StructTyID:
            case Type::ArrayTyID:
                return getTypeSize(t1) < getTypeSize(t2);
            case Type::VectorTyID:
                return getTypeSize(t1) > getTypeSize(t2);

            default:
                return getTypeSize(t1) > getTypeSize(t2);

        }
    };

    sort(scalars.begin(), scalars.end(), cmpTy);
}

unsigned int RegisterAllocation::getTypeSize(Type *valtype) {

    int size = valtype->getPrimitiveSizeInBits();

    if(auto arrtype = dyn_cast<ArrayType>(valtype)) {
        unsigned int elemsize = arrtype->getArrayElementType()->getPrimitiveSizeInBits();
        unsigned int arrnum = arrtype->getArrayNumElements();
        size = elemsize * arrnum;

    } else if(auto structype = dyn_cast<StructType>(valtype)) {
        unsigned int totsize = 0;
        for(auto element : structype->elements())
            totsize += getTypeSize(element);
        size = totsize;
    }

    return size;
}
