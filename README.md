# Introdution
The [Advent of Code](https://adventofcode.com/) is always a lot of
fun. This year I think I will write my programs in a different
language each day. I'll just code in whatever whim strikes me and
I will try to code in 24 different languages. I will also post
a reflection about my solutions in my readme as I code along.

# Day 1 - C Programming
I decided to start with my old friend, C. Ok, so I mostly code in C.
I figured if I get my favorite language out of the way first, then
I will be coding my less familiar languages in later days which will
add more challenge to me.

The first puzzle was very easy. I decided to use an assembly like
commenting style which I sometimes do with low level C code. Other
than that, this one was just a straight up use of isdigit.

The second puzzle was a little more challenging. Since the digit names
share no common prefixes, it was relatively simple to write a table
driven state machine to handle them. I put the strings in my table in
order so that I could treat the array index as a token number. Adding
'1' translated them into a digit character so that the code from part
1 would then be able to handle the digits. It's a little kludgy but
it gets the job done.

I did run into some little corner cases as I was coding this. Namely
overlapping matches and repeition of the first character. I puzzled
over it for a few minutes, racking up a few wrong answers in the
process. Ultimately I found some test cases that helped me understand
what was going on and I was able to correct the problem.

On the whole, the lexing puzzle was a little bit of an extreme ramp up
compared to previous years. I'm looking forward to a challenging
coding season this Advent!
