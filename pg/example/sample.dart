void main() {
  print("hello");
  Sample s = new Sample();
  s.sam();
}

class Sample {
  int age = 23;
  String name = "Aaaaaa";
  void sam() {
    if (age > 20) {
      print("ele");
    }
  }
}
