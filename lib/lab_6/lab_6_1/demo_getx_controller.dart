import 'package:adv_flutter_lab/utils/import_export.dart';

class DemoGetxController extends GetxController {
  List<String> items = ['item1','item2','item3'];

  List<String> getItems(){
    return items;
  }

  void addItemInList(value){
    items.add(value);
  }
}
