// 5. Write a program to print the first N even natural numbers in reverse order.
import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int i = int.parse(stdin.readLineSync()!);
  while (i >= 1) {
    if (i % 2 == 0) {
      print(i);
    }
    i--;
  }
}
