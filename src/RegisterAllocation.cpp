//
// Created by Maddalena Beccari on 20/07/18.
//

#include "StackEstimatePass.h"
#include "RegisterAllocation.h"
#include "llvm/Transforms/Utils/FunctionComparator.h"

using namespace llvm;
using namespace std;

bool RegisterAllocation :: assign(Type *t, vector<Register> &reg){
    for (int i=0; i < reg.size(); i++){
        if(TD->getTypeSizeInBits(t) < reg[i].dim && reg[i].isEmpty) {
            reg[i].isEmpty = false;
            return true;
        }
    }
    return false;
}

bool RegisterAllocation :: splitValue(Type *t, vector<Register> &reg){



}


bool RegisterAllocation :: allocate(Value* value , vector<Register> &pref , vector<Register> &fallBack){
    Type* type = value->getType();
    if(!assign(type, pref))
        if(!assign(type , fallBack))
            if(!splitValue(type ,pref ))
                notInReg.insert(value);

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

DenseSet<Value*> RegisterAllocation::regAllocation(DenseSet<Value*> liveValue){

    return liveValue;


}
