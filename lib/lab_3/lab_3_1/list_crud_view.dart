import 'package:adv_flutter_lab/lab_3/lab_3_1/add_user_page.dart';
import 'package:adv_flutter_lab/utils/import_export.dart';
import 'package:flutter/cupertino.dart';

class ListCrudView extends StatefulWidget {
  ListCrudView({super.key});

  static ListController userController = ListController();

  @override
  State<ListCrudView> createState() => _ListCrudViewState();
}

class _ListCrudViewState extends State<ListCrudView> {
  void refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List View"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddUserPage()));
              refreshScreen();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          dynamic users = ListCrudView.userController.getList()[index];
          return ListTile(
            title: Text(users),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('Are you sure want to delete ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ListCrudView.userController.removeDataFromList(
                              index,
                            );
                            Navigator.pop(context);
                            refreshScreen();
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
        itemCount: ListCrudView.userController.getList().length,
      ),
    );
  }
}
