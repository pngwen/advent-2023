// File: day-6b.cpp
// Purpose: Solution to part 2 of day 6 of advent of code in C++
//          https://adventofcode.com/2023/day/6
// Author: Robert Lowe
// Date: 6 December 2023
#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <algorithm>
#include <cctype>

std::vector<long long> parse_line()
{
    std::string line;
    std::size_t index;
    long long num;
    std::vector<long long> result;
    
    // set up the stream
    std::getline(std::cin, line);
    line.erase(std::remove_if(line.begin(), line.end(), isspace), line.end());
    index = line.find(':');
    std::istringstream is(line.substr(index+1));

    while(is>>num) {
        result.push_back(num);
    }

    return result;
}

long long count_wins(long long t, long long d) 
{
    long long count=0;
    for(long long i=1; i<t; i++) {
        if(t*i-i*i > d) {
            count++;
        }
    }
    return count;
}

int main()
{
    std::vector<long long> time;
    std::vector<long long> dist;
    long long product=1;

    // get the times and distances
    time = parse_line();
    dist = parse_line();

    // count the total number of wins
    for(auto titr=time.begin(), ditr=dist.begin(); titr!=time.end(); titr++, ditr++) {
        product *= count_wins(*titr, *ditr);
    }

    std::cout << product << std::endl;
}
