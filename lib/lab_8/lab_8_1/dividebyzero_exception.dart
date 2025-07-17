import 'package:adv_flutter_lab/utils/import_export.dart';

class DivideByZeroException implements Exception {
  String? message;

  DivideByZeroException(this.message);

  @override
  String toString() {
    Get.snackbar('Exception!!', 'Divide By Zero Exception');
    return '$message';
  }
}
