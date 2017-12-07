// paste into JS console at http://adventofcode.com/2017/day/5/input
// runtime is about 150ms  (compare to C++:75ms, not too shabby)
const d5 = [1/0,3].map(x=>(
  (a,j,c=0,i=0)=>{
    while(i>=0&&i<a.length){
      j=a[i];
      a[i]=j+(j>=x?-1:1);
      i+=j;
      c++;
    }
    return c;
  }) (document.getElementsByTagName('pre')[0].innerText.split('\n').map(Number).slice(0,-1)));

