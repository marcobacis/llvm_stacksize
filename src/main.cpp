/**
 * Main executable. Takes the llvm IR file obtained from the opencl kernel,
 * the architecture files, and gives an estimate (best, worst) of the stack size
 *
 * @authors Marco Bacis, Maddalena Beccari
 */

#include <iostream>
#include <fstream>
#include <sys/stat.h>


#include "StackEstimatePass.h"
#include "LLvm/Support/SourceMgr.h"
#include "LLvm/IR/LegacyPassManager.h"
#include "LLvm/AsmParser/Parser.h"
#include "LLvm/Transforms/Scalar.h"


using namespace llvm;
using namespace stackest;

inline bool file_exists (const std::string& name) {
    struct stat buffer;
    return (stat (name.c_str(), &buffer) == 0);
}

int main(int argc, char *argv[]) {

    StringRef filepath, regpath;

    if(argc > 2) {
        filepath = argv[1];
        regpath = argv[2];
    } else {
        std::cerr << "Usage: " << argv[0] << " module registerfile" << std::endl;
    }

    if(!file_exists(filepath.str())) {
        std::cerr << "The module file doesn't exists. Abort." << std::endl;
        return -1;
    }

    if(!file_exists(regpath.str())) {
        std::cerr << "The registers file doesn't exists. Abort." << std::endl;
        return -1;
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

    RegisterAllocation *regalloc = new RegisterAllocation(regpath);

    legacy::PassManager PM;

    /*PM.add(createPromoteMemoryToRegisterPass());
    PM.add(createConstantPropagationPass());
    PM.add(createDeadCodeEliminationPass());
    PM.add(createDeadInstEliminationPass());
    PM.add(createDeadStoreEliminationPass());*/
    PM.add(createLCSSAPass());
    PM.add(createStackEstimatePass(regalloc));
    PM.run(*module);

}