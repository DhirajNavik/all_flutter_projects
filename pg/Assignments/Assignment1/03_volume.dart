import 'dart:io';

void main() {
  stdout.write("Enter Length ");
  double length = double.parse(stdin.readLineSync()!);
  stdout.write("Enter Breadth ");
  double breadth = double.parse(stdin.readLineSync()!);
  stdout.write("Enter Height ");
  double height = double.parse(stdin.readLineSync()!);

  final result = length * breadth * height;
  print("Volume of cuboid is ${result.round()} !");
}
