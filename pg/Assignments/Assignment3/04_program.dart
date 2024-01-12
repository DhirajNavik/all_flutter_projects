// 4. Write a program to check whether a given year is a leap year or not.

import 'dart:io';

void main() {
  stdout.write("Enter a YEAR : ");
  int year = int.parse(stdin.readLineSync()!);

  if (year % 4 == 0) {
    print("$year is a leap Year");
  } else {
    print("$year is not a Leap year");
  }
}
