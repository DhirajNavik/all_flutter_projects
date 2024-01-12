import 'dart:io';

void main() {
  print("enter you name");
  String? name = stdin.readLineSync();
  print(name);
  print("enter you age");
  int age = int.parse(stdin.readLineSync()!);
  print(age);
}
