import 'dart:io';

void main() {
  int num1, num2, temp;
  stdout.write('Enter a number : ');
  num1 = int.parse(stdin.readLineSync()!);
  stdout.write('Enter a number : ');
  num2 = int.parse(stdin.readLineSync()!);

  print('Before swapping number : $num1 , $num2');
  temp = num1;
  num1 = num2;
  num2 = temp;
  print('After swapping number : $num1 , $num2');
}
