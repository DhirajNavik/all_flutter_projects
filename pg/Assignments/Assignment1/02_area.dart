import "dart:io";

const pie = 3.14;

void main() {
  stdout.write("Enter Radius of the circle : ");
  double radius = double.parse(stdin.readLineSync()!);
  final result = pie * (radius * radius);
  print('Radius of the circle is $result');
}
