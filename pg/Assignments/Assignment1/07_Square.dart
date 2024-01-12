import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int square = int.parse(stdin.readLineSync()!);
  final result = square * square;
  print("Square of $square is $result");
}
