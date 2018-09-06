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
        regbank >> minAlign >> maxAlign >> pointerSize;
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

    clearRegisterFile();

    divideVariables(liveValue);

    valueAllocation();

    return allocated;
}


void RegisterAllocation::clearRegisterFile() {
    clearRegisterType(regInt);
    clearRegisterType(regFloat);
    clearRegisterType(regGeneral);
    clearRegisterType(regVector);

    cleanValues();

    allocated.clear();

}


void RegisterAllocation::cleanValues() {
    scalars.clear();
    other.clear();
    vectors.clear();
    arrays.clear();
    structs.clear();
}

void RegisterAllocation::clearRegisterType(vector<Register> &regtype) {
    for (Register &reg : regtype) {
        reg.isEmpty = true;
    }
}

//Allocate a value all in the same register
bool RegisterAllocation::assign(Type *t, vector<vector<Register> *> &allRegister) {
    unsigned int size = getTypeSize(t);

    for (auto &regBank : allRegister) {
        for (Register &reg : *regBank) {
            if ( size <= reg.dim && reg.isEmpty) {
                reg.isEmpty = false;
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
            if (reg->at(j).isEmpty) {
                dimReg = reg->at(j).dim;
                int k = j;
                while (dimValue > 0 && reg->at(k).dim == dimReg && reg->at(k).isEmpty && k < reg->size()) {
                    dimValue -= dimReg;
                    k++;
                }

                //Trovato il primo registro vuoto gli altri vuoti della stessa dimensione saranno successivi a quello
                //quindi i registri usati sono quelli da j (incluso) a k
                if (dimValue <= 0) {
                    for(;j<k;j++){
                        reg -> at(j).isEmpty = false;
                    }
                    return true;
                }
            }
        }
    }
    return false;
}

//Try to allocate a value in a register
bool RegisterAllocation::allocate(Value *value, vector<vector<Register> *> &pref, vector<vector<Register> *> &fallBack) {
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

void RegisterAllocation::divideVariables(DenseSet<Value *> liveValue) {

    //Divide the DenseSet in five vectors
    for (Value *v : liveValue) {
        Type *t = v->getType();
        if(getTypeSize(t) > 0
           && !(t->isLabelTy() ||  t->isEmptyTy() || t->isTokenTy() || t->isVoidTy()
                || t->isMetadataTy())) {
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
    sort(structs.begin(), structs.end(), cmpTy);
    sort(arrays.begin(), arrays.end(), cmpTy);
    sort(vectors.begin(), vectors.end(), cmpTy);
    sort(other.begin(), other.end(), cmpTy);
}

unsigned int RegisterAllocation::getTypeSize(Type *valtype) {

    int size = valtype->getPrimitiveSizeInBits();


    if (auto arrtype = dyn_cast<ArrayType>(valtype)) {
        unsigned int elemsize = arrtype->getArrayElementType()->getPrimitiveSizeInBits();
        unsigned int arrnum = arrtype->getArrayNumElements();
        size = elemsize * arrnum;

    } else if (auto vectype = dyn_cast<VectorType>(valtype)) {
        unsigned int elemsize = vectype->getVectorElementType()->getPrimitiveSizeInBits();
        unsigned int num = vectype->getVectorNumElements();
        size = elemsize * num;

    } else if(auto structype = dyn_cast<StructType>(valtype)) {
        unsigned int totsize = 0;
        for(auto element : structype->elements())
            totsize += getTypeSize(element);
        size = totsize;
    } else if(valtype->isPointerTy()) size = pointerSize * 8;

    return size;
}
