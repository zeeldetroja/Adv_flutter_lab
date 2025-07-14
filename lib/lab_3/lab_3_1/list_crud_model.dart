class ListCrudModel{
  List<dynamic> list = [];

  void addDataIntoList(dynamic element){
    list.add(element);
  }

  void deleteDataFromList(index){
    list.removeAt(index);
  }

  void updateDataInList(index,data){
    list[index] = data;
  }

  List<dynamic> getList(){
    return list;
  }


}