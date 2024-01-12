import 'dart:io';

void main() {
  stdout.write("Enter a 4 digit number : ");
  int number = int.parse(stdin.readLineSync()!);

  stdout.write("Enter a digit to append at Last : ");
  int digit = int.parse(stdin.readLineSync()!);

  int remainder = (number / 10).toInt();
  print(remainder);

  int result = (remainder * 10) + digit;

  print("Removing Last element and appending $digit : $result");
}
