import 'package:adv_flutter_lab/utils/import_export.dart';

class RXListController{
  RxList<dynamic> users = [].obs;

  void addIntoList(){
    users.add('Demo');
  }
}