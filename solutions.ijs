NB. day 1
i1    =: "."0 fread 'inputs/aoc1.txt'
d1p1  =: +/(#~(=1&|.)) i1
d1p2  =: +/(#~(=((-:@#)|.]))) i1

NB. day 2
i2    =: ". S:0 cutLF fread'inputs/aoc2.txt'
d2p1  =: +/(({:-{.)@/:~"1) i2
d2p2  =: +/%/@\:~@,"1 (#~(0~:{:"1))@(#~((=<.)@%/~)) "1 i2

NB. day 3
NB. strategy
NB. first, rnz on the starting array
NB. find location of first zero, replace it with sum of neighbors

i3    =: 368078
start =: 1 1 ,: 2 4   NB. initial sequence
rz    =: (0,~(|:@|.)) ^: (0~:[:*./,)  NB. rotate (clockwise) if no zeros present, padding with a new row of zeros
zc    =: {:@(0 i.~"1])  NB. zero column

NB. corners: 3 neighbors
NB. ? ?        ? ?
NB. 0 ?        ? 0
NB. middle: 4 neighbors
NB. ? ? ?
NB. ? 0 0
NB. ^   ^ 
NB. |   col+1 if (col+1)<:maxcol 
NB. col-1 if (col-1)>:mincol
NB. middle is (behead upto col-1),(curtail after col+1)

NB. First some helpers
rl =: #"1   NB. row length

8 (4 : '(0>:])*.((#"1 y)>]) x+i:1') i.9
