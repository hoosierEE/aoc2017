NB. day 1
i1 =: "."0 fread 'inputs/aoc1.txt'
o11 =: +/(#~(=1&|.)) i1
o12 =: +/(#~(=((-:@#)|.]))) i1

NB. day 2
i2 =: ". S:0 cutLF fread'inputs/aoc2.txt'
o21 =: +/(({:-{.)@/:~"1) i2
o22 =: +/%/@\:~@,"1 (#~(0~:{:"1))@(#~((=<.)@%/~)) "1 i2
