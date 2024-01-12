// 1. Write a program to check whether a given number is divided by 3 and divided by 2.

import 'dart:io';

void main() {
  stdout.write("Enter a Number : ");
  int number = int.parse(stdin.readLineSync()!);
  if (number % 3 == 0 && number % 2 == 0) {
    print("$number is divisible by 2 & 3");
  } else {
    print('$number is not divisible by 2 & 3');
  }
}
