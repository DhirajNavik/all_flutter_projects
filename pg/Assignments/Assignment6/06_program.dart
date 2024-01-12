// 6. Write a function to calculate the factorial of a number.(TSRS)

import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int num = int.parse(stdin.readLineSync()!);
  int result = factorial(num);
  print("Factorial of $num is $result");
}

int factorial(int num) {
  if (num == 1 || num == 0) {
    return 1;
  }

  return num * factorial(num - 1);
}
