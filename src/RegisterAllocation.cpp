//
// Created by Maddalena Beccari on 20/07/18.
//

#include "StackEstimatePass.h"
#include "RegisterAllocation.h"
#include "llvm/Transforms/Utils/FunctionComparator.h"

using namespace llvm;
using namespace std;

//Allocate a value all in the same register
bool RegisterAllocation :: assign(Type *t, vector<vector<Register>*> &allRegister){
    for (int i=0; i < allRegister.size(); i++){
        vector<Register>* reg = allRegister[i];
        for (int j = 0; j < reg->size() ; j++){
            if(TD->getTypeSizeInBits(t) < reg->at(j).dim && reg->at(j).isEmpty) {
                reg->at(i).isEmpty = false;
                return true;
            }
        }

    }
    return false;
}

//Allocate a value in more than one register
bool RegisterAllocation :: splitValue(Type *t, vector<vector<Register>*> &allRegister){
    int dimReg;
    int dimValue = TD->getTypeSizeInBits(t);
    for(int i = 0; i < allRegister.size(); i++){
        vector<Register>* reg = allRegister[i];
        for (int j = 0; j < reg->size() ; j++){
            dimReg = 0;
            if(reg->at(j).isEmpty){
               dimReg = reg->at(j).dim;
               int k = j+1;
               while (dimValue && reg->at(k).dim == dimReg && k < reg->size()){
                   dimValue-= dimReg;
                   k++;
               }
               if (dimValue < 0)
                   return true;
            }
        }
        if (dimValue)
            return false;
    }

}

//Try to allocate a value in a register
bool RegisterAllocation :: allocate(Value* value , vector<vector<Register>*> &pref , vector<vector<Register>*> &fallBack){
    Type* type = value->getType();
    if(!assign(type, pref))
        if(!assign(type , fallBack))
            if(!splitValue(type , pref))
                if(!splitValue(type , fallBack))
                    notInReg.insert(value);

}

DenseSet<Value*> RegisterAllocation :: valueAllocation(){
    vector<vector<Register>*> pref;
    vector<vector<Register>*> fallBack;
    for(int i=0; i < scalars.size(); i++){

        if (!scalars[i]->getType()->isIntegerTy() ){
            pref.push_back(&regFloat);
            fallBack.push_back(&regInt);
            fallBack.push_back(&regGeneral);

       }else {
            pref.push_back(&regInt);
            fallBack.push_back(&regGeneral);
        }
        allocate(scalars[i] , pref , fallBack);
        pref.clear();
        fallBack.clear();
    }
    for(int i = 0 ; i < other.size(); i++){
        fallBack.push_back(&regInt);
        fallBack.push_back(&regGeneral);
        allocate(other[i] , pref , fallBack);
        fallBack.clear();
    }
    for(int i = 0 ; i < vectors.size(); i++){
        pref.push_back(&regVector);
        fallBack.push_back(&regInt);
        fallBack.push_back(&regGeneral);
        allocate(vectors[i] , pref , fallBack);
        pref.clear();
        fallBack.clear();
    }
    for(int i = 0 ; i < arrays.size(); i++){
        pref.push_back(&regVector);
        fallBack.push_back(&regInt);
        fallBack.push_back(&regGeneral);
        allocate(arrays[i] , pref , fallBack);
        pref.clear();
        fallBack.clear();
    }
    for(int i = 0 ; i < structs.size(); i++){
        pref.push_back(&regGeneral);
        fallBack.push_back(&regInt);
        allocate(structs[i] , pref , fallBack);
        pref.clear();
        fallBack.clear();
    }

    return notInReg;

}
void RegisterAllocation :: divideVariable(DenseSet<Value *> liveValue ){

    //Divide the DenseSet in five vectors
    for (Value* v : liveValue){
        Type *t = v->getType();
        if (t->isIntegerTy() || t->isFloatingPointTy())
            scalars.push_back(v);
        else if (t->isStructTy())
            structs.push_back(v);
        else if(t->isArrayTy())
            arrays.push_back(v);
        else if(t->isVectorTy())
            vectors.push_back(v);
        else
            other.push_back(v);

    }


//Choose the sort logic
    auto cmpTy = [this] (Value* i, Value* j){
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
                return TD->getTypeSizeInBits(t1) > TD->getTypeSizeInBits(t2);

            case Type::StructTyID:
            case Type::ArrayTyID:
                return TD->getTypeSizeInBits(t1) < TD->getTypeSizeInBits(t2);
            case Type::VectorTyID:
                return TD->getTypeSizeInBits(t1) > TD->getTypeSizeInBits(t2);

            default:
                return TD->getTypeSizeInBits(t1) > TD->getTypeSizeInBits(t2);

        }
    };

    sort(scalars.begin(), scalars.end(), cmpTy);


}

