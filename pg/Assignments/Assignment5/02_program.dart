// 2. Write a program to print the first N natural numbers.
import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int input = int.parse(stdin.readLineSync()!);
  var i = 1;
  while (i <= input) {
    print(i);
    i++;
  }
}
