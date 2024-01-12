import 'dart:io';

void main() {
  stdout.write("Enter number one ");
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number two ");
  int num2 = int.parse(stdin.readLineSync()!);
  int result = num1 + num2;
  print('Sum of $num1 and $num2 : $result');
}
