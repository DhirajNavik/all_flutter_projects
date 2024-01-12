void main() {
  final bus = Bus();
  bus.accelerate();
}

class Vehicle {
  String brand = "AA";
  int wheels = 20;
  int top_speed = 160;
  void status() {
    print("meowww..");
  }

  int speed = 10;
  void accelerate() {
    print(speed + 20);
  }
}

class Car extends Vehicle {
  String brand = "BMW";
  int wheels = 4;
  void status() {
    print("bowwww");
  }

  @override
  void accelerate() {
    print(speed + 5);
  }
}

class Bus extends Car {}
