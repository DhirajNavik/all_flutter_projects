void main() {
  final dog = Animal(name: 'tommy', breed: 'india', age: 12);
  print(dog.age);
  dog.running();
}

class Animal {
  String name;
  String breed;
  int age;
  Animal({required this.name, required this.breed, required this.age}) {
    print("class constructor called");
    () {
      print("Satatus");
    }();
  }
  running() {
    print("run..............");
  }
}
