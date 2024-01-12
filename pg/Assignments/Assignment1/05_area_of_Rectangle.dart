import 'dart:io';

void main() {
  stdout.write("Enter Length in meters : ");
  int length = int.parse(stdin.readLineSync()!);
  stdout.write("Enter Width in meters : ");
  int width = int.parse(stdin.readLineSync()!);

  int result = length * width;

  print('Area of Rectangle is : ${result}m2');
}
