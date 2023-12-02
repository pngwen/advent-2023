/* File: day-1a.c
 * Purpose: Solution to the second part of the puzzle found at 
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
    int m;
    char *tab[] = { "one", "two", "three", "four", "five",
                   "six", "seven", "eight", "nine" };
    char *mpos[9] = {tab[0], tab[1], tab[2], tab[3], tab[4], 
                     tab[5], tab[6], tab[7], tab[8]};
    int i;

    while((c=getchar()) != EOF) {       /* Read all of stdin */
        m=c;
        for(i=0; i<9; i++) {            /* manage the fsm states for lex table */
            if(m == *mpos[i]) {
                mpos[i]++;
            } else {
                mpos[i] = tab[i];
                if(m == *mpos[i]) {
                    mpos[i]++;
                }
            }
            if(!*mpos[i]) {             /* handle complete matches */
                c = i + '1';            /* translate the character */
                mpos[i] = tab[i];       /* reset the match */
            }
        }
        if(isdigit(c)) {                /* Process digits */
            c -= '0';                   /* Convert to a digit */
            if(first < 0) {             /* Is it first? */
                first = c;              /* Handle first */
            }
            last = c;                   /* Handle last */
        } else if(c == '\n') {          /* Handle end of line */
            sum += first * 10 + last;   /* Accumulate the sum */
            first = -1;                 /* Reset first */
            for(i=0; i<9; i++) {
                mpos[i] = tab[i];       /* Reset tabi */
            }
        }
    }

    printf("%d\n", sum);                /* display the results */
}
