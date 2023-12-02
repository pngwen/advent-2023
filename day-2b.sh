#!/bin/bash
# File: day-2b.sh
# Purpose: Answer part 2 of day 2 of the advent of code as a bash script
#          https://adventofcode.com/2023/day/2

function game () {
    num=$(echo "$1" | cut -d: -f1 | cut -d ' ' -f2)
    play=$(echo "$1" | cut -d: -f2)
    red=0
    green=0
    blue=0

    IFS=';'
    for pull in $play
    do
        IFS=","
        for cube in $pull
        do
            cube=$(echo "$cube" | xargs)
            color=$(echo "$cube" | cut -d ' ' -f2)
            count=$(echo "$cube" | cut -d ' ' -f1)
            if [ "$color" == "red" ]  &&  [ "$count" -gt "$red" ]; then
                red=$count
            elif [ "$color" == "green" ] &&  [ "$count" -gt "$green" ]; then
                green=$count
            elif [ "$color" == "blue" ]  && [ "$count" -gt "$blue" ]; then
                blue=$count
            fi
        done
    done

    echo $(($red * $green * $blue))
}

sum=0
while read line
do
    sum=$(($(game "$line") + $sum))
done

echo $sum
