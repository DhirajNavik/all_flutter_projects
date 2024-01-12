// 3. Write a program to check whether a given number is positive, negative or zero.

import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int number = int.parse(stdin.readLineSync()!);

  if (number == 0) {
    print("Given Number $number is Zero");
  } else if (number > 0) {
    print("Given number $number is Postive");
  } else if (number < 0) {
    print("Given number $number is Negative");
  } else {
    print("Enter a valid number");
  }
}
