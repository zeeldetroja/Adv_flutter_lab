import 'dart:async';
import 'dart:io';

import 'package:adv_flutter_lab/lab_13/lab_13_1/demo_error.dart';

void main() async {
  int a = 10;
  int b;
  try {
    await Future.delayed(Duration(seconds: 5)).timeout(
      Duration(seconds: 2),
      onTimeout: () {
        throw TimeoutException('Timeout Exception');
        // throw DemoException();
      },
    );
    print('Enter b:');
    b = int.parse(stdin.readLineSync()!);
    double c = a / b;
    print("Division :$c");
  } on TimeoutException {
    print('Time Out Error');
  } on DemoException {
    print(DemoException().message);
  } on Exception {
    print('Other Exception occur!!');
  } catch (e) {
    print('Catch');
  }
}
