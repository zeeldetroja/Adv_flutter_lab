import 'package:adv_flutter_lab/utils/import_export.dart';

class AddUserPage extends StatelessWidget {
  dynamic data;
  int? index;

  AddUserPage({super.key, this.data, this.index}) {
    if (data != null) nameController.text = data['name'];
  }

  ListCrudView userController = ListCrudView();

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add User Page")),
      body: Column(
        children: [
          TextFormField(controller: nameController),
          ElevatedButton(
            onPressed: () {
              // dynamic user = ListCrudView.userController.getList();
              // ListCrudView.userController.addDataIntoList(data);
              if (data != null) {
                data['name'] = nameController.text.toString();
                ListCrudView.userController.updateDataInList(index, data);
              } else {
                ListCrudView.userController.addDataIntoList(data);
              }
              Navigator.of(context).pop();
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
