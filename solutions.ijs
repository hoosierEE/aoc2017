NB. day 1
i1 =: "."0 fread 'inputs/aoc1.txt'
o11 =: +/(#~(=1&|.)) i1
o12 =: +/(#~(=((-:@#)|.]))) i1

NB. day 2
i2 =: ". S:0 cutLF fread'inputs/aoc2.txt'
o21 =: +/(({:-{.)@/:~"1) i2
o22 =: +/%/@\:~@,"1 (#~(0~:{:"1))@(#~((=<.)@%/~)) "1 i2

divides_evenly =: #~((=<.)@%/~)  NB. select where y is same as floor-of-division of table y
not_self =: #~(0~:{:"1)          NB. select where y is not zero in 1st column
div_sorted =: %/@\:~             NB. sort descending, then divide (operate on 2-item lists)
s2 =: +/ div_sorted@,"1 not_self @ divides_evenly "1 i2