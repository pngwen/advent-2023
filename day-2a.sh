#!/bin/bash
# File: day-2a.sh
# Purpose: Answer part 1 of day 2 of the advent of code as a bash script
#          https://adventofcode.com/2023/day/2

function game () {
    num=$(echo "$1" | cut -d: -f1 | cut -d ' ' -f2)
    play=$(echo "$1" | cut -d: -f2)

    IFS=';'
    for pull in $play
    do
        IFS=","
        for cube in $pull
        do
            cube=$(echo "$cube" | xargs)
            color=$(echo "$cube" | cut -d ' ' -f2)
            count=$(echo "$cube" | cut -d ' ' -f1)
            if [[ "$color" == "red"  &&  "$count" -gt "12" ]] || 
               [[ "$color" == "green"  &&  "$count" -gt "13" ]] ||
               [[ "$color" == "blue"  &&  "$count" -gt "14" ]]; then
                echo 0
                return
            fi
        done
    done

    echo $num
}

sum=0
while read line
do
    sum=$(($(game "$line") + $sum))
done

echo $sum
