// 2. Write a function to calculate simple interest. (TSRS)

import 'dart:io';

void main() {
  stdout.write("Enter Amount : ");
  int amount = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Rate of interest : ");
  int Rate = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Time in Years : ");
  int Time = int.parse(stdin.readLineSync()!);

  final result = simpleInterest(a: amount, r: Rate, t: Time);
  print('Simple interest is : $result');
}

int simpleInterest({required t, required a, required r}) {
  return ((a * r * t) / 100).toInt();
}
