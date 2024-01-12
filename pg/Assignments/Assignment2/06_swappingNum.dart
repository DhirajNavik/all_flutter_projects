import 'dart:io';

void main() {
  stdout.write('Enter a number : ');
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write('Enter a number : ');
  int num2 = int.parse(stdin.readLineSync()!);

  print("Before Swapping : $num1 , $num2");

  num1 = num1 + num2;
  //34
  num2 = num1 - num2;
  //12
  num1 = num1 - num2;
  //22

  print("After Swapping : $num1 , $num2");
}
