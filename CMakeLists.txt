cmake_minimum_required(VERSION 3.10)

project(stacksize)

set(CMAKE_CXX_STANDARD 11)

set(LLVM_ROOT "/usr/local/")

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message(STATUS "LLVM include dirs: ${LLVM_INCLUDE_DIRS}")
message(STATUS "LLVM Definitions: ${LLVM_DEFINITIONS}")

#Directory Structure

set(INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include")
set(SOURCES_DIR "${PROJECT_SOURCE_DIR}/src")
file(GLOB SOURCES ${SOURCES_DIR}/*.cpp)

#LLVM Stuff
add_definitions(${LLVM_DEFINITIONS})
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LLVM_COMPILE_FLAGS} -fno-rtti")
include_directories(${LLVM_INCLUDE_DIRS} ${INCLUDE_DIR})
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)

# Main executable
add_llvm_executable(main ${SOURCES})

# Add llvm libraries
llvm_map_components_to_libnames(llvm_libs support core irreader analysis)

# Link LLVM libraries
target_link_libraries(main ${llvm_libs})