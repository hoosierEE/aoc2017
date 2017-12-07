day1 =: 0 :0
i1 =. "."0 fread 'inputs/aoc1.txt'
p1 =. +/(#~(=1&|.)) i1                             NB. sum where self equals 1-rotate
p2 =. +/(#~(=((-:@#)|.]))) i1                      NB. sum where self equals half-rotate
p1;p2
)

day2 =: 0 :0
i2 =. ". S:0 cutLF fread'inputs/aoc2.txt'
p1 =. +/(({:-{.)@/:~"1)                            NB. sum (last minus first) of sorted rows
p2 =. +/%/@\:~"1(#~(0~:{:"1))@(#~((=<.)@%/~))"1 i2 NB. sum even quotients within rows
p1;p2
)

day3 =: 0 :0
i3   =. 368078
sp   =. (|.@|:,~>./@,+1+i.@#)                      NB. nth Ulam spiral (seed with ,.1): https://youtu.be/dBC5vnwf6Zw
lti  =. *./@(i3&>@,)                               NB. flattened list less than input?
usp  =. sp^:lti^:_ ,.1                             NB. ulam spiral up to puzzle input
fc   =. i.~"1 -.#@]                                NB. column where x appears in y
crd  =. 4 :'(x fc y),~ x i.~ ,(x fc y){"1 y'       NB. coordinates
c1   =. 1  crd usp
c2   =. i3 crd usp
p1   =. +/c1-c2                                    NB. By chance, c2 are less than c1.  Otherwise need magnitudes.

init =. 1 1 ,: 2 4                                 NB. initial sequence
rz   =. (0,~(|:@|.)) ^: (0~:[:*./,)                NB. rotate (clockwise) if no zeros present, padding with a new row of zeros
zc   =. {:@(0 i.~"1])                              NB. index of first zero column
nn   =. 4 :'y{~(#~ (0<:]) *. (#"1 y)>]) (x+i:1)'   NB. nearest neighbor columns
nv   =. (([:(+/^:2) _2{. (zc])nn"1]) rz)           NB. generate next value.  (nv init) is 5
ni   =. [:(3 :'(nv y) (<_1;(zc y)) } y') rz        NB. nth iteration  (ni^:1 init) is 3 2 $ 2 1 4 1 5 0
p2   =. (<_1;0){ni^:lti^:_ init                    NB. first number larger than input
p1;p2
)

day4 =: 0 :0
i4   =. cut each cutLF fread'inputs/aoc4.txt'
i4a  =. 1=;>./each,.>@{."1 L:1 (#;~.)/.~ each i4   NB. quick and dirty: 1 equals count of unique words per passphrase
p1   =. +/ i4a                                     NB. how many?
p2   =. +/;*./@~:L:1 /:~L:0 i4#~i4a                NB. valid if sorted word appears only once
p1;p2
)

day5 =: ('END.';')')rplc~ (0 :0)
ex5 =. 0 3 0 1 _3                                  NB. example list
i5 =. ;".each cutLF fread'inputs/aoc5.txt'
    d5 =: 4 :0
      arr =. y
      c =. 0
      i =. 0
      len =. #arr
      while. ((0<:i)*.len>i) do.
        j =. i{arr
        arr =. (j + _1 1{~j<x) i}arr
        i =. i+j
        c =. c+1
      end.
      c;arr
END.

d5_run =: 3 :0
  p1 =. _ d5 i5                                    NB. execution time about 0.5s
  p2 =. 3 d5 i5                                    NB. execution time about 35s
  p1;p2
END.
)

NB. day6 =: 0 :0
f   =: ;". each TAB cut;cutLF fread 'inputs/aoc6.txt'
fh  =: (i. ,: ]) >./  NB. (first_index_of_highest_value ,: highest_value)
fh1 =: i.@#=fh  NB. 1 where fh else 0
amt =: 13 :'(>.y%15),:15|y'  NB. amounts to add to (rest,:current)
mt2 =: 13 :'(15|y),(>.y%15)'