// 7.Write a program to make the last digit of a number stored in a variable as zero.
// (Example - if x=2345 then make it x=2340)

import 'dart:io';

void main() {
  stdout.write('Enter a number : ');
  int input = int.parse(stdin.readLineSync()!);

  input = (input / 10).toInt();
  input = input * 10;

  print('Result : $input');
}
