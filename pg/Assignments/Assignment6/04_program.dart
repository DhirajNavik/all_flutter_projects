// 4. Write a function to print first N natural numbers (TSRN)

import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int num = int.parse(stdin.readLineSync()!);
  naturalnum(num);
}

naturalnum(int num) {
  int i = 1;
  while (i <= num) {
    print(i);
    i++;
  }
}
