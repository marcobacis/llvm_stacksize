cmake_minimum_required(VERSION 3.10)

project(stacksize)

set(CMAKE_CXX_STANDARD 11)

set(LLVM_ROOT "/usr/local/")

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message(STATUS "LLVM include dirs: ${LLVM_INCLUDE_DIRS}")
message(STATUS "LLVM Definitions: ${LLVM_DEFINITIONS}")


add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)


add_subdirectory(StackEstimate)