// run in the JS console at http://adventofcode.com/2017/day/5/input
[1/0,3].map(x=>(
  (a,j,c=0,i=0)=>{
    while(i>=0&&i<a.length){
      j=a[i];
      a[i]=j+(j>=x?-1:1);
      i+=j;
      c++;
    }
    return c;
  }) (document.getElementsByTagName('pre')[0].innerText.split('\n').map(Number).slice(0,-1))
)
// Execution times:
// part1: 1.68ms
// part2: 148.76ms
