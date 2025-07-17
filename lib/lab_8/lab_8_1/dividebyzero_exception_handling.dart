import 'dart:io';

import 'package:adv_flutter_lab/lab_8/lab_8_1/dividebyzero_exception.dart';

void main() {
  stdout.write("Enter a:");
  int a = int.parse(stdin.readLineSync()!);

  stdout.write("Enter b:");
  int b = int.parse(stdin.readLineSync()!);

  try {
    if (b == 0) {
      throw DivideByZeroException('Divide by zero exception occur!');
    }
    double c = a / b;
    print("Answer = $c");
  } on DivideByZeroException {
    print('Divide by zero error');
  } on Exception {
    print('In Exception');
  } catch (e) {
    print('catch');
  } finally {
    print('Finnaly');
  }
}
