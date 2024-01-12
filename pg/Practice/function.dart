// void main() {
//   var details = example1();
//   print(details.$1);

//   var (age, name, isAlive, rating) = example1();
//   print(isAlive);

//   print(example1());

//   print(example2());
//   String lname = "Navik";

//   positionalArgument("Dhiraj", lname, 18);
//   namedArgument(true, name: "dhiraj", lname: lname, age: 24);

//   final stuffs = namedRecords();
//   print(stuffs.number);
//   print(stuffs.add);
// }

// (int, String, bool, double) example1() {
//   //records
//   return (12, 'Dhiraj', true, 6.99);
// }

// String? example2() {
//   // return null;
// }

// void positionalArgument(String name, String lname, int age) {
//   print(name);
//   print(lname);
//   print(age);
// }

// void namedArgument(bool isAlive,
//     {required String name, int? age, required String lname}) {
//   print(name);
//   print(age);
//   print(lname);
//   print(isAlive);
// }

// ({int number, String add}) namedRecords() {
//   return (add: 'gwk', number: 9866);
// }

// void main() {
//   // retuningFun()();
//   var eg = retuningFun();
//   print(eg());
//   () {
//     print("Yoyo");
//   }();
// }

// Function retuningFun() {
//   return () {
//     print("YOYo");
//   };
// }

// main() {
//   print(arrowFun());
// }

// String arrowFun() => "Arrow Function";

void main() {
  print("Hello World");

  int a = 1;
  int b = 2;
  print(add(a, b));

  Animal dasfds = Animal('cat', 22);
  final ddd = Animal('aa', 232);
  print(dasfds.name);
}

int add(int a, int b) {
  return a + b;
}

class Animal {
  String name;
  int age;
  Animal(this.name, this.age);
}
