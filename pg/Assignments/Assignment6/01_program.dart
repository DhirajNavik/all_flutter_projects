// 1. Write a function to calculate the area of a circle. (TSRS)
// A = pi r^2

import 'dart:io';

void main() {
  const pi = 3.14159265359;
  stdout.write("Enter radius of circle : ");
  double radius = double.parse(stdin.readLineSync()!);
  double result = areaOfCircle(pi, radius);
  print('Area of circle is : ${result.toStringAsFixed(2)}');
}

double areaOfCircle(pi, r) {
  return pi * (r * r);
}
