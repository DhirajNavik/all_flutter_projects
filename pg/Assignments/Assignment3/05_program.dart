// 5. Write a program to find greater among three numbers. If two or three numbers are identical and greatest among all then print it only once.

import 'dart:io';

void main() {
  stdout.write("Enter first numbers : ");
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter second numbers : ");
  int num2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter third numbers : ");
  int num3 = int.parse(stdin.readLineSync()!);

  if (num1 >= num2) {
    if (num1 >= num3) {
      print(num1);
    } else {
      print(num3);
    }
  } else if (num2 >= num3) {
    print(num2);
  }
}
