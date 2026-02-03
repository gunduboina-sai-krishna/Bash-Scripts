#!/bin/bash

# Addition of numbers

add() {
    local num1=$1
    local num2=$2
    sum=$(( num1+num2 ))
    echo "$sum"
}
    result=$(add 7 2)
    echo "The sum is : $result"