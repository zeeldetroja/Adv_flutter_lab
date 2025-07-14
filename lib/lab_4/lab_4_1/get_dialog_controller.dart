import '../../utils/import_export.dart';

class GetDialogController extends GetxController {
  RxInt a = 1.obs;

  void incrementValue() {
    ++a;
  }
}
