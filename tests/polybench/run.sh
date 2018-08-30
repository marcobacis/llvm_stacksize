#!/usr/bin/env bash

for i in `ls *.ll | sort -V`
do
    #echo ""
    #echo $i
    #~/ACA-P4-Stack-Size/build/main $i 2>&1
    #result=($(~/llvm/build/bin/llc -O3  -march=arm -mcpu=cortex-a55 $i  2>&1 > /dev/null | grep "stack size" | grep  -Eo '[0-9]{2,10}'))
    result=($(~/llvm/build/bin/llc -O3 -march=x86 -mcpu=skylake  $i  2>&1 > /dev/null | grep "stack size" | grep  -Eo '[0-9]{2,10}'))
    #result=($(~/llvm/build/bin/llc -O0  -march=nvptx $i  2>&1 > /dev/null | grep "stack size" | grep  -Eo '[0-9]{2,10}'))

    in=${result[2]}
    op=${result[4]}
    max=$(($in>$op?$in:$op))
    echo $((${result[0]} + $max))
done

