# Advent of Code - 2017 Edition

> using [J](http://jsoftware.com/)

Here I'll outline my thought process when solving the challenges.
Not sure if it'll be useful to anyone but my future self, but whatevs, it's fun.

I'm mostly omitting any "file read and parse" boilerplate so the algorithm stands out more.

## Day 1
Part 1 is "Sum where y equals its 1-rotation".

    +/(#~(=1&|.))
    
Part 2 is "Sum where y equals its half-length rotation" which is more verbose:

    +/(#~(=((-:@#)|.])))


## Day 2
Part 1 is "Sum first and last of sorted lines".

    +/(({:-{.)@/:~"1)

Part 2: My first thought was to go for the imperative, loopy solution.  In pseudocode:

    initialize sum to 0
    for x in line:
      for y in line:
        if x isn't y:
          if (x div y) is integer then sum += (x div y)

I wanted to make a tacit/trains style solution in J, which wasn't obvious to me at first.  I ended up essentially turning the pseudocode inside-out.

    +/%/@\:~@,"1 (#~(0~:{:"1))@(#~((=<.)@%/~))"1

Here's the same thing, but "un-golfed", which hopefully shows the semantics better:

    divides_evenly =: #~((=<.)@%/~)  NB. select where y is same as floor-of-division of table y
    not_self =: #~(0~:{:"1)          NB. select where y is not zero in 1st column
    div_sorted =: %/@\:~             NB. sort descending, then divide (operate on 2-item lists)
    i2 =: ". S:0 cutLF fread'inputs/aoc2.txt'
    s2 =: +/ div_sorted@,"1 not_self @ divides_evenly "1 i2
