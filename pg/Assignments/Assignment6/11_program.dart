// 11. Write a function to check whether a given number is Prime or not. (TSRS)
import 'dart:io';

void main() {
  stdout.write("Enter a number to check if its prime or not : ");
  int number = int.parse(stdin.readLineSync()!);

  String result = primeNum(number);
  print('Given number $number is $result');
}

String primeNum(int number) {
  int i = 2;
  String result = number <= 1 ? "Prime Number" : "Prime Number";
  for (i; i < number; i++) {
    if (number % i == 0) {
      result = "not a prime Number";
    }
  }
  return result;
}
