-- File: day-12a.lua
-- Purpose: Lua solution to the first problem of day 12 of advent 2023
--          https://adventofcode.com/2023/day/12
-- Author: Robert Lowe
-- Date: 12 December 2023
inspect=require('inspect')

function parse_input(line)
    local result = {}

    result["report"] = string.match(line, "([^ ]+) ")
    result["constraint"] = string.match(line, " (.+)")

    return result
end


function get_pattern(report)
    local count, result
    count = 0
    result = {}

    for c in string.gmatch(report, ".") do
        if c == "#" then
            count = count + 1
        elseif count ~= 0 then
            table.insert(result, count)
            count = 0
        end
    end

    if count ~=0 then
        table.insert(result, count)
    end

    return table.concat(result, ",")
end


function count_ways(report, constraint) 
    local broken, working

    -- handle the situation where we have no replacements
    if string.find(report, "?") == nil then
        if get_pattern(report) == constraint then
            return 1
        else
            return 0
        end
    end

    -- try each replacement
    broken = count_ways(string.gsub(report, "?", "#", 1), constraint)
    working = count_ways(string.gsub(report, "?", ".", 1), constraint)
    return broken + working
end


-- main routine
sum = 0
while io.read(0) ~= nil do
    line = io.read("l")
    line = parse_input(line)
    ways = count_ways(line.report, line.constraint)
    sum = sum + ways
end
print(sum)
