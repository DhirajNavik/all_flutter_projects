import 'dart:io';

// void main() {
//   stdout.write('Enter a number : ');
//   int data = int.parse(stdin.readLineSync()!);
//   String strData = data.toString();
//   final result = strData.split('');
//   final length = result.length;
//   print('First Digit : ${result[0]}');
//   print('Last Digit : ${result[length - 1]}');
//   final middleData = (result.length / 2).round();
//   print('Middle Digit : ${result[middleData - 1]}');
// }

// int.parse(data);
// data.toString();

void main() {
  stdout.write('Enter a number : ');
  int data = int.parse(stdin.readLineSync()!);

  int firstNum = data, lastNum = 0, middleNum = 0;
// First Number
  while (firstNum > 10) {
    firstNum = (firstNum / 10).toInt();
  }
// Middel Number
  middleNum = (data / 10).toInt();
  middleNum = middleNum % 10;

// Last Number
  lastNum = data % 10;

  print('$data First Number is : $firstNum');
  print('$data Middle Number is : $middleNum');
  print('$data Last Number is : $lastNum');
}
