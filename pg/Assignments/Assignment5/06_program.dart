// 6. Write a program to print the first N odd natural numbers

import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int input = int.parse(stdin.readLineSync()!);
  var i = 1;
  while (i <= input) {
    if (i % 2 != 0) {
      print(i);
    }
    i++;
  }
}
