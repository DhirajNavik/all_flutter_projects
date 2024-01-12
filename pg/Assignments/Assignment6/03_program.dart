// 3. Write a function to check whether a given number is even or odd. Return 1 if the number is even, otherwise return 0. (TSRS)

import 'dart:io';

void main() {
  stdout.write("Enter Number : ");
  int input = int.parse(stdin.readLineSync()!);

  int result = isEvenOdd(input);
  print(result);
}

int isEvenOdd(int i) {
  bool result = i % 2 == 0;

  if (result) {
    return 1;
  } else {
    return 0;
  }
}
