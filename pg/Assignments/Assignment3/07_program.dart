// 7. Write a program which takes the length of the sides of a triangle as an input. Display whether the triangle is valid or not.
import 'dart:io';

void main() {
  stdout.write("Enter Side a value : ");
  int sideA = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Side b value : ");
  int sideB = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Side c value : ");
  int sideC = int.parse(stdin.readLineSync()!);

  if (sideA + sideB > sideC && sideB + sideC > sideA && sideC + sideA > sideB) {
    print("Its a valid circle");
  } else {
    print("Not a valid Circle");
  }
}
