## ACA project P4 - Stack size estimation

The goal of this project is to give an estimate about the stack size of a program using LLVM.
Two estimates are given:
- pessimistic, assuming all the values are allocated in the stack (target-independent)
- optimistic, with a simple heuristic simulating register allocation

The register allocation simulation is performed based on a register file, containing informations about the available registers in the target architecture.
In this way, the estimate can be obtained without performing the actual asm code generation.

#### Running and testing
The application has been tested using LLVM 6.0, and run over the polybench benchmark, in order to see how effective is the estimate.

To build the project we used cmake (LLVM_ROOT default is /usr/local, change it if different):
```
mkdir build
cd build
cmake ..
make
```

The executable is ```build/main ```, which takes as arguments the llvm IR file path and the register file path.

Polybench's IR files are in ```tests/polybench```, and the application can be tested by running it with ```tests/runtest.sh```.

To get the target-dependent stack size and check the results, it is possible to apply the patch in ```tests/asmprinter.patch``` to the AsmPrinter generic class in llvm (```lvm/lib/CodeGen/AsmPrinter/AsmPrinter.cpp```) and then run llc. Llc will output the frame size of each function in the module,  so that the maximum stack size can be computed and compared to our results.

#### Register file format

The first line contains the minimum and maximum alignment for the target architecture (in bytes). Then, for each type of register, the dimension (in bits) and number of registers can be set (each on a new line). The accepted types are int, float, vector and generic.

Example file:
```
4 8
int,64,4
float,32,8
vector,128,8
generic,32,4
generic,16,4
```


#### Credits
Authors: Marco Bacis (marco.bacis@mail.polimi.it), Maddalena Beccari (maddalenabeccari.beccari@mail.polimi.it)

Supervisor: Stafano Cherubin (stefano.cherubin@polimi.it)

