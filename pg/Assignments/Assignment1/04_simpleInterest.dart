import 'dart:io';

void main() {
  stdout.write("Enter Amount : ");
  double amount = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Rate of interest : ");
  double Rate = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Time in Years : ");
  double Time = double.parse(stdin.readLineSync()!);

  int result = ((amount * Rate * Time) / 100).toInt();

  print('Simple interest is : $result');
}
