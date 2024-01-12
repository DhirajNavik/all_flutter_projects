// 13. Write a function to print first N prime numbers (TSRN)
import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int input = int.parse(stdin.readLineSync()!);
  printPrime(input);
}

bool isPrime(int n) {
  if (n <= 1) return false;

  for (var i = 2; i < n; i++) if (n % i == 0) return false;

  return true;
}

void printPrime(int n) {
  for (var i = 2; i <= n; i++) {
    if (isPrime(i)) stdout.write("$i ");
  }
}
