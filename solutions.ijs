NB. day 1
i1    =: "."0 fread 'inputs/aoc1.txt'
d1p1  =: +/(#~(=1&|.)) i1                  NB. sum where self equals 1-rotate
d1p2  =: +/(#~(=((-:@#)|.]))) i1           NB. sum where self equals half-rotate


NB. day 2
i2    =: ". S:0 cutLF fread'inputs/aoc2.txt'
d2p1  =: +/(({:-{.)@/:~"1) i2                            NB. sum (last minus first) of sorted rows
d2p2  =: +/%/@\:~"1 (#~(0~:{:"1))@(#~((=<.)@%/~)) "1 i2  NB. sum even quotients within rows


NB. day 3
i3   =: 368078
sp   =: (|.@|:,~>./@,+1+i.@#)                      NB. nth Ulam spiral (seed with ,.1): https://youtu.be/dBC5vnwf6Zw
lti  =: *./@(i3&>@,)                               NB. flattened list less than input?
usp  =: sp^:lti^:_ ,.1                             NB. ulam spiral up to puzzle input
fc   =: i.~"1 -.#@]                                NB. column where x appears in y
crd  =: 4 :'(x fc y),~ x i.~ ,(x fc y){"1 y'       NB. coordinates
c1   =: 1  crd usp
c2   =: i3 crd usp
d3p1 =: +/c1-c2                                    NB. By chance, c2 are less than c1.  Otherwise need magnitudes.

init =: 1 1 ,: 2 4                                 NB. initial sequence
rz   =: (0,~(|:@|.)) ^: (0~:[:*./,)                NB. rotate (clockwise) if no zeros present, padding with a new row of zeros
zc   =: {:@(0 i.~"1])                              NB. index of first zero column
nn   =: 4 :'y{~(#~ (0<:]) *. (#"1 y)>]) (x+i:1)'   NB. nearest neighbor columns
nv   =: (([:(+/^:2) _2{. (zc])nn"1]) rz)           NB. generate next value.  (nv init) is 5
ni   =: [:(3 :'(nv y) (<_1;(zc y)) } y') rz        NB. nth iteration  (ni^:1 init) is 3 2 $ 2 1 4 1 5 0
d3p2 =: (<_1;0){ni^:lti^:_ init                    NB. first number larer than input


NB. day 4
i4   =: cut each cutLF fread'inputs/aoc4.txt'
i4a  =: 1=;>./each,.>@{."1 L:1 (#;~.)/.~ each i4  NB. quick and dirty: 1 equals count of unique words per passphrase
d4p1 =: +/ i4a                                    NB. how many?
d4p2 =: +/;*./@~:L:1 /:~L:0 i4#~i4a               NB. valid if sorted word appears only once

