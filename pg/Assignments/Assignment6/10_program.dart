// 10. Write a function to calculate HCF of two numbers. (TSRS)
import 'dart:io';

void main() {
  stdout.write('Enter First number : ');
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write('Enter Second number : ');
  int num2 = int.parse(stdin.readLineSync()!);
  int result = hcf(num1, num2);
  print('H-C-F of $num1 and $num2 is $result');
}

int hcf(int num1, int num2) {
  int result = 0;
  int small = num1 < num2 ? num1 : num2;
  int i = 1;
  for (i; i < small; i++) {
    if (num1 % i == 0 && num2 % i == 0) {
      result = i;
    }
  }
  return result;
}
