// 1. Write a program to print (Flutter is Awesome) N times on the screen.
import 'dart:io';

void main() {
  String text = 'Flutter is Awesome';
  stdout.write("How many times u want to print text : ");
  int input = int.parse(stdin.readLineSync()!);
  for (var i = 1; i <= input; i++) {
    print('$text $i');
  }
}
