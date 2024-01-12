// 12. Write a function to find the next prime number of a given number. (TSRS)

import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int input = int.parse(stdin.readLineSync()!);
  var result = nextPrimeNum(input);
  print('$input next prime number is $result');
}

int nextPrimeNum(int input) {
  int i = input + 1;
  while (true) {
    if (isPrime(i)) {
      break;
    }
    i++;
  }
  return i;
}

bool isPrime(int n) {
  if (n <= 1) return false;

  for (var i = 2; i < n; i++) if (n % i == 0) return false;

  return true;
}
