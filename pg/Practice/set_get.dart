void main() {
  // print(Privateclass().eg1);
  print(Privateclass().geteg1);
  final eg = Privateclass();
  print(eg.geteg1);
  eg.seteg1 = 99;
  print(eg.eg1);
}

class Privateclass {
  int eg1 = 68;

  int get geteg1 => eg1;

  set seteg1(int n) {
    eg1 = n;
  }
}
