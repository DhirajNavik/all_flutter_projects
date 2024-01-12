// 10.Write a C program to input marks of five subjects Physics, Chemistry, Biology,
// Mathematics and Computer. Calculate percentage and grade according to following:
// Percentage >= 90% : Grade A
// Percentage >= 80% : Grade B
// Percentage >= 70% : Grade C
// Percentage >= 60% : Grade D
// Percentage >= 40% : Grade E
// Percentage < 40% : Grade F

import 'dart:io';

void main() {
  stdout.write("Enter Physics Marks : ");
  int m1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Chemistry Marks : ");
  int m2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Biology Marks : ");
  int m3 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Mathematics Marks : ");
  int m4 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Computer Marks : ");
  int m5 = int.parse(stdin.readLineSync()!);

  int result = (m1 + m2 + m3 + m4 + m5) ~/ 5;
  print(result);

  if (result >= 90) {
    print("Grade A");
  } else if (result >= 80) {
    print("Grade B");
  } else if (result >= 70) {
    print("Grade C");
  } else if (result >= 60) {
    print("Grade D");
  } else if (result >= 40) {
    print("Grade E");
  } else {
    print("Fail");
  }
}
