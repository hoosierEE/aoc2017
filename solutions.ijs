NB. day 1
i1    =: "."0 fread 'inputs/aoc1.txt'
d1p1  =: +/(#~(=1&|.)) i1
d1p2  =: +/(#~(=((-:@#)|.]))) i1

NB. day 2
i2    =: ". S:0 cutLF fread'inputs/aoc2.txt'
d2p1  =: +/(({:-{.)@/:~"1) i2
d2p2  =: +/%/@\:~@,"1 (#~(0~:{:"1))@(#~((=<.)@%/~)) "1 i2

NB. day 3
NB. Rotate-and-zero-pad array if no zeros.
NB. Replace first zero with sum of neighbors.
i3    =: 368078
init  =: 1 1 ,: 2 4                                 NB. initial sequence
rz    =: (0,~(|:@|.)) ^: (0~:[:*./,)                NB. rotate (clockwise) if no zeros present, padding with a new row of zeros
zc    =: {:@(0 i.~"1])                              NB. zero column
nn    =: 4 : 'y{~(#~ (0<:]) *. (#"1 y)>]) (x+i:1)'  NB. nearest neighbor columns
nv    =: (([:(+/^:2)_2{.(zc])nn"1]) rz)             NB. generate next value. (nv init) returns 5
NB. Iterate until greater than puzzle input. Maybe factor into do-while?
NB. answer appears after 61 iterations:
NB. (369601&>@,)([:(3 :'(nv y) (<_1;(zc y))}y') rz)^:61 init

