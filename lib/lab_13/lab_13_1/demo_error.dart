// import 'package:adv_flutter_lab/utils/import_export.dart';
//
// class DemoException implements Exception{
//   String? message;
//
//   @override
//   String toString() {
//     Get.snackbar('Exception!!','Asynchronous Exception Occur');
//     return '$message';
//   }
// }

class DemoException implements Exception {
  String message = 'Custom DemoException occurred!';
}
