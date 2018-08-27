#!/usr/bin/env bash

regfile=${1-example.reg}

for i in `ls polybench/*.ll | sort -V`
do
    #echo ""
    #echo $i
    #~/ACA-P4-Stack-Size/build/main $i 2>&1
    ../build/main $i $regfile  2>&1 > /dev/null | grep "main"
done

