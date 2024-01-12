// 9. Write a program to find the nature of roots of a quadratic equation.

import 'dart:io';

void main() {
  stdout.write('Enter value a : ');
  double a = double.parse(stdin.readLineSync()!);
  stdout.write('Enter value c : ');
  double b = double.parse(stdin.readLineSync()!);
  stdout.write('Enter value b : ');
  double c = double.parse(stdin.readLineSync()!);

  final result = b * b - (4 * a * c);
  if (result == 0) {
    print('$result \'s Real and equal roots.');
  } else if (result < 0) {
    print('It\'s Unequal and imaginary.');
  } else if (result > 0) {
    print('It\'s Real and unequal root.');
  }
}
