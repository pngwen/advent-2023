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

# Day 2 - Bash Scripting
I decided to do today's problems in bash. Its IFS operation made it easy 
to iterate over the individual plays in the game. I used two programs 
"xargs" and "cut" to easily clean up and split the input. From there, it
was just a few simple bash tests for both parts. In the first, it was
testing against 12, 13, and 14. For the second it was tracking the max
for each.

I got both of these in the first try, so today's problems were simpler.
I wonder if this year we will have fluctuating complexity. Though I
suppose yesterday's problems would have been easier had I used a regex
library or something!

# Day 3 - Python Programming
More parsing! I had thought about coding this one using list comprehension and
some functional things, but with 2d operations it turns into a garbled mess. So
I did this with straight up imperative python. I had a slight problem on the
first part with having numbers that were too high. The reason was that 
I was counting end lines as part labels. Checking to make sure I wasn't 
looking at \n did the trick! The second part was quite simple, though
I did have to modify my neighborhood function to do it.

My code is concise, but I would refactor my functions in the second
one if this were a real product. The reason is that the functions
are tightly coupled to the global scope. Still, it gets the job done!

If we have another parsing program, I may just use a parser generator.
I've never solved one of these using YACC, but I don't see why I couldn't!

# Day 4 - PHP Programming
Ok, so this has a bit of parsing but it's not like the other peculiar parsing
puzzles. So I decided to do this in a non-parsing language. I did this one
in php. I tried to make it a bit clunky as that is the php style. It's awful,
but it gets the job done.

Today was far easier than the ones before it. This is certainly an odd year 
complexity wise! I had no real issues with this one, other than getting a 
little bit tired of typing "$" over and over.

# Day 5 - TCL Programming
I was amused by yet another strong text parsing presence, and so I decided
to code in TCL today. That made processing the input a snap! I love TCL,
such a nice elegant language.

The first problem I worked out quickly by doing some interval computation
magic. But then I got to the second part. Nearly 24 hours in, and my TCL
script is still running. I sure picked a fine day for some elegant
string processing. I could rewrite it in a faster language, but then I am
curious to see if the mighty strings will win out.

# Day 6 - C++ Programming
Today was super simple. My first attempt worked in both cases, where the
hardest part was really switching my ints to long longs. Part 1 worked
on first compile and part 2 I had to compile twice after I realized 
the data type needs. Still, that change was made by search and replace.

I guess today was meant to be a real time race to get first answer? This
is like day 1 stuff! Still, I have kids and a job so I did not get to 
stay up until the problem was posted. 

I used C++ because I thought something intense may be coming on the
part 2 problem, and I was burned yesterday. It looks like I spent
another fast language on nothing! I think I'll keep zig in the hole 
for the next number cruncher.

Oh, and yes my TCL program is still running...
