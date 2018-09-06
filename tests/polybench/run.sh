#!/usr/bin/env bash


function stacksize {
    result=($(~/llvm/build/bin/llc -O$1  -march=$2 -mcpu=$3 $4  2>&1 > /dev/null | grep "stack size" | grep  -Eo '[0-9]{2,10}'))
    in=${result[2]-0}
    op=${result[4]-0}
    max=$(($in>$op?$in:$op))
    echo $((${result[0]} + $max))
}

for i in `ls *.ll | sort -V`
do
    arm=$(stacksize 2 arm cortex-a55 $i)
    #x86=$(stacksize 3 x86-64  skylake $i)
    #nvidia=$(stacksize 0 nvptx64 sm_70 $i)

    #echo -e "${x86}\t${nvidia}\t${arm}" 
    echo $arm
done

