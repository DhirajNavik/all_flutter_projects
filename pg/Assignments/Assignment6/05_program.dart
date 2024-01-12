// 5. Write a function to print first N odd natural numbers. (TSRN)

import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int num = int.parse(stdin.readLineSync()!);
  oddNaturalNum(num);
}

void oddNaturalNum(int num) {
  int i = 1;
  while (i <= num) {
    if (i % 2 != 0) {
      print(i);
    }
    i++;
  }
}
