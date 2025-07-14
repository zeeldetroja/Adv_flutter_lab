import 'package:adv_flutter_lab/utils/import_export.dart';

class ListController{
  ListCrudModel model = ListCrudModel();

  void addDataIntoList(element) => model.addDataIntoList(element);

  void removeDataFromList(index) => model.deleteDataFromList(index);

  void updateDataInList(index,data) => model.updateDataInList(index, data);

  List<dynamic> getList() => model.getList();

}