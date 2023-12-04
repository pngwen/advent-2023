<?php
/*
 * File: day-4a.php
 * Purpose: Answer part 1 of day 4 of the 2023 advent of code
 *          https://adventofcode.com/2023/day/4
 * Author: Robert Lowe
 * Date: 4 December 2023
 */
$stdin = fopen('php://stdin', 'r');
$total = 0;

// read each line
while(!feof($stdin)) {
    $count = 0;
    $winning = [];
    $line = fgets($stdin);
    if(!strlen($line)) { continue; }
    $card = explode("|", explode(":", $line)[1]);

    // get the winning numbers
    foreach(explode(" ", trim($card[0])) as $num) {
        if(!strlen($num)) continue;
        $winning[$num] = true;
    }

    // accumulate points
    foreach(explode(" ", trim($card[1])) as $num) {
        if(!strlen($num)) continue;
        if(array_key_exists($num, $winning)) {
            $count++;
            $winning[$num];
        }
    }

    $total += $count > 0 ? pow(2, $count-1) : 0;
}

echo $total . "\n";
