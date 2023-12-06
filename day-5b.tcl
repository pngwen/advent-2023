#!/usr/bin/env tclsh
# File: day-5a.tcl
# Purpose: Tcl solution to day 5 part 1 of the 2023 Advent of Code
#          https://adventofcode.com/2023/day/5
# Author: Robert Lowe
# Date: December 5, 2023

# convert a string into a triple
proc parse_range {s} {
    return [string trim [regsub -all " +" $s " "]]
}

# read a map from stdin
proc read_map {} {
    set result [list]
    if {[gets stdin line] < 0} {
        return result
    }
    
    # split the line apart and get the label
    set line [split $line ":"]
    lappend result [lindex $line 0]
    set line [lindex $line 1]

    # get the range on the line if there is one
    if [string length $line] {
        lappend result [parse_range $line]
    }

    # get the map values
    while {[gets stdin line] >= 0} {
        if {![string length $line]} {
            break
        }
        lappend result [parse_range $line]
    }

    return $result
}


# converts a range into a map
proc map_range {d r} {
    set dest [lindex $r 0]
    set src [lindex $r 1]
    set range [lindex $r 2]

    while {$range > 0} {
        dict set d $src $dest
        incr src
        incr dest 
        incr range -1
    }

    return $d
}

proc gmget {gm n} {
    foreach r $gm {
        set dest [lindex $r 0]
        set src [lindex $r 1]
        set range [lindex $r 2]

        if {$n < $src} {
            continue
        }

        set diff [expr $n - $src]
        if {$diff <= $range} {
            return [expr $dest + $diff]
        }
    }
    return $n
}


# get all the maps from stdin
while {![eof stdin]} {
    set map [read_map]
    dict set maps [lindex $map 0] [lrange $map 1 end]
}

# get the maps
set soilmap [dict get $maps "seed-to-soil map"]
set fertmap [dict get $maps "soil-to-fertilizer map"]
set watmap [dict get $maps "fertilizer-to-water map"]
set ligmap [dict get $maps "water-to-light map"]
set tmpmap [dict get $maps "light-to-temperature map"]
set hummap [dict get $maps "temperature-to-humidity map"]
set locmap [dict get $maps "humidity-to-location map"]

# get the seeds list
set seeds [expr [dict get $maps "seeds"]]

# find the nearest location
set nearest  ""
for {set i 0} {$i < [llength $seeds]} {incr i 2} {
    set start [lindex $seeds $i]
    set end [expr $start + [lindex $seeds [expr {$i + 1}]]]
    puts $i
    for {set s $start} {$s < $end} {incr s} {
        set loc [gmget $locmap [gmget $hummap [gmget $tmpmap [gmget $ligmap [gmget $watmap [gmget $fertmap [gmget $soilmap $s]]]]]]]
        if {![string length $nearest] || $loc < $nearest} {
          set nearest $loc
        }
    }
}
puts $nearest
