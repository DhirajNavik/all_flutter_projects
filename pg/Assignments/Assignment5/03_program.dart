// 3. Write a program to print the first N natural numbers in reverse order.

import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int input = int.parse(stdin.readLineSync()!);
  while (input >= 1) {
    print(input);
    input--;
  }
}
