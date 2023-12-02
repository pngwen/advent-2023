/* File: day-1a.c
 * Purpose: Solution to the first part of the puzzle found at 
 *          https://adventofcode.com/2023/day/1
 * Author: Robert Lowe
 * Date:   December 1, 2023
 */
#include <stdio.h>
#include <ctype.h>

int main()
{
    int first=-1;
    int last;
    int sum = 0;
    int c;

    while((c=getchar()) != EOF) {       /* Read all of stdin */
        if(isdigit(c)) {                /* Process digits */
            c -= '0';                   /* Convert to a digit */
            if(first < 0) {             /* Is it first? */
                first = c;              /* Handle first */
            }
            last = c;                   /* Handle last */
        } else if(c == '\n') {          /* Handle end of line */
            sum += first * 10 + last;   /* Accumulate the sum */
            first = -1;                 /* Reset first */
        }
    }

    printf("%d\n", sum);                /* display the results */
}
