#!/usr/bin/env bash

regfile=${1-example.reg}

echo -e "max\tx86\tarm"

for i in `ls polybench/*.ll | sort -V`
do
    #../build/main $i $regfile  2>&1 > /dev/null

    x86=($(../build/main $i example.reg 2>&1 > /dev/null | grep  -Eo '[0-9]{2,10}'))
    #nvptx=($(../build/main $i nvidia.reg 2>&1 > /dev/null | grep  -Eo '[0-9]{2,10}'))
    arm=($(../build/main $i arm.reg 2>&1 > /dev/null | grep  -Eo '[0-9]{2,10}'))

    #echo -e "${x86[0]}\t${x86[1]}\t${nvptx[1]}\t${arm[1]}" 
    echo -e "${x86[0]}\t${x86[1]}\t${arm[1]}"
done

