NB. day1 =: 0 :0
NB. i1 =. "."0 fread 'inputs/aoc1.txt'
NB. p1 =. +/(#~(=1&|.)) i1                             NB. sum where self equals 1-rotate
NB. p2 =. +/(#~(=((-:@#)|.]))) i1                      NB. sum where self equals half-rotate
NB. p1;p2
NB. )
NB. 
NB. day2 =: 0 :0
NB. i2 =. ". S:0 cutLF fread'inputs/aoc2.txt'
NB. p1 =. +/(({:-{.)@/:~"1)                            NB. sum (last minus first) of sorted rows
NB. p2 =. +/%/@\:~"1(#~(0~:{:"1))@(#~((=<.)@%/~))"1 i2 NB. sum even quotients within rows
NB. p1;p2
NB. )
NB. 
NB. day3 =: 0 :0
NB. i3   =. 368078
NB. sp   =. (|.@|:,~>./@,+1+i.@#)                      NB. nth Ulam spiral (seed with ,.1): https://youtu.be/dBC5vnwf6Zw
NB. lti  =. *./@(i3&>@,)                               NB. flattened list less than input?
NB. usp  =. sp^:lti^:_ ,.1                             NB. ulam spiral up to puzzle input
NB. fc   =. i.~"1 -.#@]                                NB. column where x appears in y
NB. crd  =. 4 :'(x fc y),~ x i.~ ,(x fc y){"1 y'       NB. coordinates
NB. c1   =. 1  crd usp
NB. c2   =. i3 crd usp
NB. p1   =. +/c1-c2                                    NB. By chance, c2 are less than c1.  Otherwise need magnitudes.
NB. 
NB. init =. 1 1 ,: 2 4                                 NB. initial sequence
NB. rz   =. (0,~(|:@|.)) ^: (0~:[:*./,)                NB. rotate (clockwise) if no zeros present, padding with a new row of zeros
NB. zc   =. {:@(0 i.~"1])                              NB. index of first zero column
NB. nn   =. 4 :'y{~(#~ (0<:]) *. (#"1 y)>]) (x+i:1)'   NB. nearest neighbor columns
NB. nv   =. (([:(+/^:2) _2{. (zc])nn"1]) rz)           NB. generate next value.  (nv init) is 5
NB. ni   =. [:(3 :'(nv y) (<_1;(zc y)) } y') rz        NB. nth iteration  (ni^:1 init) is 3 2 $ 2 1 4 1 5 0
NB. p2   =. (<_1;0){ni^:lti^:_ init                    NB. first number larger than input
NB. p1;p2
NB. )
NB. 
NB. day4 =: 0 :0
NB. i4   =. cut each cutLF fread'inputs/aoc4.txt'
NB. i4a  =. 1=;>./each,.>@{."1 L:1 (#;~.)/.~ each i4   NB. quick and dirty: 1 equals count of unique words per passphrase
NB. p1   =. +/ i4a                                     NB. how many?
NB. p2   =. +/;*./@~:L:1 /:~L:0 i4#~i4a                NB. valid if sorted word appears only once
NB. p1;p2
NB. )
NB. 
NB. day5 =: ('END.';')')rplc~ (0 :0)
NB. ex5 =. 0 3 0 1 _3                                  NB. example list
NB. i5 =. ;".each cutLF fread'inputs/aoc5.txt'
NB. d5 =: 4 :0
NB.   arr =. y
NB.   c =. 0
NB.   i =. 0
NB.   len =. #arr
NB.   while. ((0<:i)*.len>i) do.
NB.     j =. i{arr
NB.     arr =. (j + _1 1{~j<x) i}arr
NB.     i =. i+j
NB.     c =. c+1
NB.   end.
NB.   c;arr
NB. END.
NB. 
NB. d5_run =: 3 :0
NB.   p1 =. _ d5 i5                                    NB. execution time about 0.5s
NB.   p2 =. 3 d5 i5                                    NB. execution time about 35s
NB.   p1;p2
NB. END.
NB. )
NB. 
NB. day6 =: ('END.';')')rplc~ (0 :0)
NB. i6 =: ".&>TAB cut;cutLF fread 'inputs/aoc6.txt'
NB. fn =: 3 :0
NB.   m    =. >./ y                                    NB. max
NB.   c    =. <:@# y                                   NB. count - 1
NB.   q    =. 1>.<.m%c                                 NB. max(quotient, 1)
NB.   d    =. q#~+/m>:+/\c#q                           NB. even distribution whose sum is less than m
NB.   mask =. (#y) {. d,~m-+/d                         NB. addition mask
NB.   rot  =. m {.@I.@:= y                             NB. rotate by this amount
NB.   (-rot) |. mask + 0 (0)}rot |. y                  NB. rotate then (delete max value) then (add mask) then un-rotate
NB. END.

NB. TODO can this be solved using power-of conjunction?
NB. Why yes it can, thanks to this solution:
NB. https://www.reddit.com/r/adventofcode/comments/7hvtoq/2017_day_6_solutions/dqu8x0u/
NB. d6_run =: 3 :0
NB.   ff =. (,fn@{:)^:(#=#@~.)^:_
NB.   px =. ff ,: i6
NB.   p1 =. <:# px
NB.   p2 =. <:# ff ,: px
NB.   p1;p2
NB. END.
NB. )
NB. day7 =: ('END.';')')rplc~ (0 :0)
NB. f =: cutLF fread'inputs/aoc7.txt'
NB. 'a b' =: |: s =: (#~[:{:"1 a:~:])'>'cut every f
NB. c =: (<"1 ' 'taketo"1 a) ,: (<@cut@(','-.~])"1 b)                          NB. parent,:children
NB. part1 =: ({~"1 a:(I.@:~:) (#@{.)-.~L:0 ({.i.L:1{:)) ^:([:-.2 1-:$@])^:_ c
NB.       ^^^^                                                             filter rows
NB.            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                         where head appears in any tail
NB.                                                 ^^^^^^^^^^^^^^^^^^^    until 1 remains
NB. part 2; need weights this time
NB. d =: ', '&splitstring@deb each <"1 b
NB. e =: ({.,(".&.>@{:))"1 (2{.' 'cut])&><"1 a
NB. s =: ((".&.>@(1{])),(0{]),3}.]) each ','-.~L:0 cut each f
NB. weights =: 2{.&>s
NB. pcw =: weights,.(weights{~])L:0 ({."1 weights)&i.L:1 (2}.each s)  NB. (parent;weight),(child;weight)

NB. Day 8 is in inputs/day8.ijs - did a bunch of transformations in Vim to make it into a valid J program, then eval.

NB. day 9

f =: fread'inputs/aoc9.txt'
NB. can this be done with dyad ;: (Seq. Machine)?
