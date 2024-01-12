// 9. Write a function to calculate LCM of two numbers. (TSRS)
import 'dart:io';

void main() {
  stdout.write('Enter First number : ');
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write('Enter Second number : ');
  int num2 = int.parse(stdin.readLineSync()!);

  int value = lcm(num1, num2);
  print('L-c-M of $num1 and $num2 is $value');
}

int lcm(int num1, int num2) {
  int big;
  int result;
  if (num1 > num2) {
    big = num1;
    print(big);
  } else {
    big = num2;
  }

  while (true) {
    if (big % num1 == 0 && big % num2 == 0) {
      result = big;
      break;
    }
    big = big + 1;
  }
  return result;
}
