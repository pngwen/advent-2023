// File: day-6a.cpp
// Purpose: Solution to part of day 6 of advent of code in C++
//          https://adventofcode.com/2023/day/6
// Author: Robert Lowe
// Date: 6 December 2023
#include <iostream>
#include <vector>
#include <string>
#include <sstream>

std::vector<int> parse_line()
{
    std::string line;
    std::size_t index;
    int num;
    std::vector<int> result;
    
    // set up the stream
    std::getline(std::cin, line);
    index = line.find(':');
    std::istringstream is(line.substr(index+1));

    while(is>>num) {
        result.push_back(num);
    }

    return result;
}

int count_wins(int t, int d) 
{
    int count=0;
    for(int i=1; i<t; i++) {
        if(t*i-i*i > d) {
            count++;
        }
    }
    return count;
}

int main()
{
    std::vector<int> time;
    std::vector<int> dist;
    int product=1;

    // get the times and distances
    time = parse_line();
    dist = parse_line();

    // count the total number of wins
    for(auto titr=time.begin(), ditr=dist.begin(); titr!=time.end(); titr++, ditr++) {
        product *= count_wins(*titr, *ditr);
    }

    std::cout << product << std::endl;
}
