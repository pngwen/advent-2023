<?php
/*
 * File: day-4b.php
 * Purpose: Answer part 2 of day 4 of the 2023 advent of code
 *          https://adventofcode.com/2023/day/4
 * Author: Robert Lowe
 * Date: 4 December 2023
 */
$stdin = fopen('php://stdin', 'r');
$total = 0;
$card_wins = []; 

// read each line
while(!feof($stdin)) {
    $count = 0;
    $winning = [];
    $line = fgets($stdin);
    if(!strlen($line)) { continue; }
    $line = explode(":", $line);
    $cnum = explode(" ", $line[0]);
    $cnum = intval(end($cnum));
    $card = explode("|", $line[1]);

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
        }
    }

    $card_wins[$cnum] = $count;
}

$card_count=array_fill(1, sizeof($card_wins), 1);

foreach($card_wins as $cnum => $count) {
    for($i=1; $i<=$count; $i++) {
        $index = $cnum + $i;
        if(array_key_exists($index, $card_count)) {
            $card_count[$index] += $card_count[$cnum];
        }
    }
}

echo array_sum($card_count) . "\n";
