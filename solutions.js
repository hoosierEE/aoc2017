// http://www2.unibas.it/gscanniello/Giuseppe_Scanniello%40unibas/Home_files/TOSEM.pdf
const inp=document.getElementsByTagName('pre')[0].innerText;
let ig=false,g=0,s=0,d=0,c=inp[0];
for(let i=0; i<inp.length; ++i){
  c=inp[i];
  if(c==='!') i++;
  else if(ig && c!=='>') g++;
  else if(c==='<') ig=true;
  else if(c==='>') ig=false;
  else if(c==='{') s+=d++;
  else if(c==='}') d--;
}
console.log(s,g);

// paste into JS console at http://adventofcode.com/2017/day/5/input
// runtime is about 150ms  (compare to C++:75ms, not too shabby)
// const d5 = [1/0,3].map(x=>(
//   (a,j,c=0,i=0)=>{
//     while(i>=0&&i<a.length){
//       j=a[i];
//       a[i]=j+(j>=x?-1:1);
//       i+=j;
//       c++;
//     }
//     return c;
//   }) (inp.split('\n').map(Number).slice(0,-1)));
// const d7i = inp.split('\n').slice(0,-1);
// const ne = d7i.map(x=>x.split(' -> '));  // node, edges
// const o={};
// const nw = ne.forEach(x=>{
//   let [n, w] = x[0].split(' ');
//   o[n] = {weight: eval(w), kids: x[1] && x[1].split(', ')};
// });
