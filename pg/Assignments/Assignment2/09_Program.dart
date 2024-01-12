import 'dart:io';

void main() {
  double usd = 76.23;
  double single_Rupee = 1 / usd;
  stdout.write("Enter in Rupees to convert to USD : ");
  int rupees = int.parse(stdin.readLineSync()!);
  double result = rupees * single_Rupee;

  print('$rupees in USD : ${result.toStringAsFixed(2)} \$');
}
