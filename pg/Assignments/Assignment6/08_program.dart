// 8. Write a function to calculate the number of arrangements one can make from n items and r selected at a time. (TSRS)

import 'dart:io';

void main() {
  stdout.write("Enter total items : ");
  double n = double.parse(stdin.readLineSync()!);
  stdout.write("Enter selected items : ");
  double r = double.parse(stdin.readLineSync()!);
  double result = arrangements(n, r);
  print('There are total of ${result.toInt()} possible Arrangements');
}

double arrangements(double n, double r) {
  return (factorial(n) / factorial((n - r)));
}

double factorial(double num) {
  if (num == 1 || num == 0) {
    return 1;
  }

  return num * factorial(num - 1);
}
