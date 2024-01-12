// 2. Write a program to check whether a given number is divided by 7 or divided by 3.

import 'dart:io';

void main() {
  stdout.write("Enter a Number : ");
  int number = int.parse(stdin.readLineSync()!);
  if (number % 7 == 0 || number % 3 == 0) {
    print("$number is divisible by 7 or 3 ");
  } else {
    print('$number is not divisible by 7 or 3');
  }
}
