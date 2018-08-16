//
// Created by Maddalena Beccari on 20/07/18.
//

#include "StackEstimatePass.h"
#include "RegisterAllocation.h"
#include "llvm/Transforms/Utils/FunctionComparator.h"

using namespace llvm;
using namespace std;

//Choose the sort logic
bool RegisterAllocation :: cmpType (Value* i, Value* j){
    Type *t1 = i->getType();
    Type *t2 = j->getType();

    /* if (t1 == t2)
         return 0;

   if (t1->getTypeID() != t2->getTypeID())
         return t1->getTypeID()>t2->getTypeID();*/

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

            /* StructType *STyL = cast<StructType>(t1);
             StructType *STyR = cast<StructType>(t2);
             if (STyL->getNumElements() != STyR->getNumElements())
                 STyL.
                 return cmpNumbers(STyL->getNumElements(), STyR->getNumElements());
             if (STyL->isPacked() != STyR->isPacked())
                 return cmpNumbers(STyL->isPacked(), STyR->isPacked());
             for (unsigned i = 0, e = STyL->getNumElements(); i != e; ++i) {
                 if (int Res = cmpTypes(STyL->getElementType(i), STyR->getElementType(i)))
                     return Res;
             }
             return 0;*/

        case Type::ArrayTyID:
        case Type::VectorTyID:
            return TD->getTypeSizeInBits(t1) < TD->getTypeSizeInBits(t2);

            /* auto *STyL = cast<SequentialType>(t1);
            auto *STyR = cast<SequentialType>(t2);
            if (STyL->getNumElements() != STyR->getNumElements())
                return STyL->getNumElements()> STyR->getNumElements();
            return cmpTypes(STyL, STyR);
        } */

        default:
            return TD->getTypeSizeInBits(t1) > TD->getTypeSizeInBits(t2);

    }
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
    sort(scalars.begin(), scalars.end(), cmpType);


}

DenseSet<Value*> RegisterAllocation::RegAllocation(DenseSet<Value*> liveValue){

    //TODO da architettura a registri
    return liveValue;


}
