# File: day-3a.py
# Purpose: Solve problem 1 on day 3 of advent of ocde
#          https://adventofcode.com/2023/day/3
# Author: Robert Lowe
# Date: December 3, 2023
import sys

# read the grid and get its stats
grid=sys.stdin.readlines()
w = len(grid[0])
h = len(grid)

def neighborhood(x,y):
    """
    Get all of the grid neighbors
    """
    result = []
    for nx in range(max(0, x-1), min(w, x+2)):
        for ny in range(max(0, y-1), min(h, y+2)):
            if x == nx and y == ny:
                continue
            result.append(grid[ny][nx])
    return result

def is_part(x,y):
    """
    Check to see if a number is a part.
    """
    for c in neighborhood(x,y):
        if not c.isdigit() and c != '.' and c != "\n":
            return True 
    return False

#initial state
total=0
num=0
count=False

# go through the grid, parsing as we go
for y in range(0, h):
    for x in range(0, w):
        c = grid[y][x]

        # handle non-number
        if not c.isdigit():
            if count:
                total += num
            num = 0
            count = False
            continue

        num = num * 10 + int(c)
        if is_part(x,y): 
            count = True

# add the last potential part
if count:
    total += num

print(total)
