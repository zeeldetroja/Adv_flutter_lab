import 'package:adv_flutter_lab/utils/import_export.dart';

class GetDialogView extends StatelessWidget {
  GetDialogView({super.key});

  GetDialogController demoController = GetDialogController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get Dialog")),
      body: Center(child: Obx(() => Text(demoController.a.toString()))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: "Get Alert Dialog",
            textConfirm: "Yes",
            textCancel: "No",
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              Get.bottomSheet(
                Container(
                  height: 500,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(title: Text('Data $index'));
                          },
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//Second Program
// Get.snackbar('Snackbar', 'Program thay gyo!!!');
