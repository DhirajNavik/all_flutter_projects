// 6. Write a program to check whether a given character is an alphabet (uppercase), an alphabet (lower case), a digit or a special character.

import 'dart:io';

void main() {
  stdout.write("Enter a Letter or Number or Character : ");
  var input = stdin.readLineSync().toString()[0];
  if (input.toLowerCase() == input.toUpperCase()) {
    if (int.tryParse(input) != null) {
      print("$input is a number");
    } else {
      print("$input is a special Character");
    }
  } else if (input.toLowerCase() != input.toUpperCase()) {
    if (input == input.toLowerCase()) {
      print("$input is a Lower case alphabet");
    } else {
      print("$input is a Upper case alphabet");
    }
  } else {
    print("Invalid Input .. .");
  }
}

















// import 'dart:io';

// void main() {
//   stdout.write("Enter a Letter or Number or Character : ");
//   var input = stdin.readLineSync().toString()[0];

//   if (input.contains(new RegExp('^[a-z]+'))) {
//     print('$input is a alphabet (lowercase)');
//   } else if (input.contains(new RegExp('^[A-Z]+'))) {
//     print('$input is a alphabet (uppercase)');
//   } else if (input.contains(new RegExp('^[0-9]+'))) {
//     print('$input is a Digit');
//   } else {
//     print('$input is a Special Character');
//   }
// }













// void main() {
//   stdout.write("Enter a Letter ,Number or Character : ");
//   final input = stdin.readLineSync();

//   List lowerCaseLetter = 'abcdefghijklmnopqrstuvwxyz'.split('');
//   List upperCaseLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
//   List number = '1234567890'.split('');
//   List specialCharacter = "@#\$%!*&?".split('');

//   for (var i in lowerCaseLetter) {
//     if (input == i) {
//       print("$input is a alphabet (lowercase)");
//     }
//   }

//   for (var i in upperCaseLetter) {
//     if (input == i) {
//       print("$input is a alphabet (Uppercase)");
//     }
//   }

//   for (var i in number) {
//     if (input == i) {
//       print("$input is a Number");
//     }
//   }

//   for (var i in specialCharacter) {
//     if (input == i) {
//       print("$input is a Specail character");
//     }
//   }
// }
