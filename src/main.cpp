/**
 * Main executable. Takes the llvm IR file obtained from the opencl kernel,
 * the architecture files, and gives an estimate (best, worst) of the stack size
 *
 * @authors Marco Bacis, Maddalena Beccari
 */

#include <iostream>
#include <fstream>


#include "LLvm/Support/SourceMgr.h"
#include "LLvm/IR/Module.h"
#include "LLvm/IR/LegacyPassManager.h"
#include "LLvm/AsmParser/Parser.h"
#include "StackEstimatePass.h"

using namespace llvm;
using namespace stackest;

int main(int argc, char *argv[]) {

    StringRef filepath;

    if(argc > 1) {
        filepath = argv[1];
    } else {
        std::cerr << "Usage: " << argv[0] << " module" << std::endl;
    }

    LLVMContext context;
    SMDiagnostic error;
    Module *module;

    auto modPtr = parseAssemblyFile(filepath, error, context);

    if (modPtr == nullptr) {
        std::cerr << "File not parsed correctly. Abort." << std::endl;
        return -1;
    }

    module = modPtr.get();

    legacy::PassManager PM;

    PM.add(new StackEstimatePass());
    PM.run(*module);

}