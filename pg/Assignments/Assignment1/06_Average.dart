import 'dart:io';

main() {
  stdout.write("Enter number 1 : ");
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter number 2 : ");
  int num2 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter number 3 : ");
  int num3 = int.parse(stdin.readLineSync()!);

  final result = (num1 + num2 + num3) / 3;
  print('Average of 3 numbers is : ${result.round()}');
}
