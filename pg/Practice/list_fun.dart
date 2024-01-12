void main() {
  List l = [
    {22, 45},
    {'k', 'l'}
  ];
  print(l);
  print(l[0]);
//   for(int ls=0 ;ls<l.length;ls++){
//     print(l[ls]);
//   }
  print(l.map<List>((e) => (e)));
  
}
