// 8. Write a program which takes the month number as an input and display number of days in that month.

import 'dart:io';

void main() {
  stdout.write('Enter month number : ');
  int month = int.parse(stdin.readLineSync()!);

  if (month < 8) {
    if (month == 2) {
      print("$month month has 28 or 29 days depending on that year");
    } else if (month % 2 != 0) {
      print("$month month has 31 days");
    } else if (month % 2 == 0) {
      print("$month month has 30 days");
    }
  } else if (month % 2 == 0) {
    print("$month month has 31 days");
  } else {
    print("$month month has 30 days");
  }
}











































// import 'dart:io';

// void main() {
//   stdout.write('Enter month number : ');
//   int month = int.parse(stdin.readLineSync()!);

//   if (month < 1 || month > 12) {
//     print("Invalid Month");
//   } else {
//     if (month == 1 ||
//         month == 3 ||
//         month == 5 ||
//         month == 7 ||
//         month == 8 ||
//         month == 10 ||
//         month == 12) {
//       print("$month month has 31 days");
//     } else if (month == 4 || month == 6 || month == 9 || month == 11) {
//       print("$month month has 30 days");
//     } else {
//       print("$month month has 28 or 29 days depending on that year");
//     }
//   }
// }























// import 'dart:io';

// void main() {
//   Map month_days = {
//     1: {'January': 31},
//     2: {'Feburary': 28},
//     3: {'March': 31},
//     4: {'April': 30},
//     5: {'May': 31},
//     6: {'June': 30},
//     7: {'July': 31},
//     8: {'August': 31},
//     9: {'September': 30},
//     10: {'October': 31},
//     11: {'November': 30},
//     12: {'December': 31}
//   };
//   stdout.write('Enter a random month : ');
//   int month = int.parse(stdin.readLineSync()!);
//   print("${month_days[month].keys} has ${month_days[month].values} days ");
// }
