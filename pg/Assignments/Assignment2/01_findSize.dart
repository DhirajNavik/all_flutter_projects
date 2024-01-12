import 'dart:io';

main() {
  stdout.write('Enter data to find its length : ');

  var input = stdin.readLineSync();
  stdout.write("${input.runtimeType} {$input} length is : ");
  print(input?.length);
}
