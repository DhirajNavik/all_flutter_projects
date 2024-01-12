void main() {
  final a1 = V2();
  a1.abc();
  print(a1.a);
}

class V1 {
  int a = 5;
  abc() {
    print(a += 50);
  }
}

class V2 extends V1 {
  int a = 50;
  @override
  abc() {
    print(a += 100);
  }
}
