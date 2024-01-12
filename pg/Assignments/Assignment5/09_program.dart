// 9. Write a program to print the squares of first N natural numbers in reverse order

import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int i = int.parse(stdin.readLineSync()!);
  while (i >= 1) {
    print(i * i);
    i--;
  }
}
