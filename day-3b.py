# File: day-3b.py
# Purpose: Solve problem 2 on day 3 of advent of ocde
#          https://adventofcode.com/2023/day/3
# Author: Robert Lowe
# Date: December 3, 2023
import sys

# read the grid and get its stats
grid=sys.stdin.readlines()
w = len(grid[0])
h = len(grid)
gear_cand={}

def neighborhood(x,y):
    """
    Get all of the grid neighbors
    """
    result = []
    for nx in range(max(0, x-1), min(w, x+2)):
        for ny in range(max(0, y-1), min(h, y+2)):
            if x == nx and y == ny:
                continue
            result.append((nx, ny))
    return result


def gear_cands(x,y):
    """
    Check to see if a number is a part.
    """
    global gear_cand

    result = set()
    for nx, ny in neighborhood(x,y):
        c = grid[ny][nx]
        if c=="*":
            key = (nx,ny)
            if not key in gear_cand:
                gear_cand[key] = []
            result.add(key)
    return result 


#initial state
total=0
num=0
gear_coord = set()

# go through the grid, parsing as we go
for y in range(0, h):
    for x in range(0, w):
        c = grid[y][x]

        # handle non-number
        if not c.isdigit():
            for key in gear_coord:
                gear_cand[key].append(num)
            num = 0
            gear_coord = set()
            continue

        num = num * 10 + int(c)
        gear_coord = gear_coord.union(gear_cands(x, y))


# compute the total for the gears
total=0
for key in gear_cand:
    g = gear_cand[key]
    if len(g) == 2:
        total += g[0] * g[1]
print(total)
