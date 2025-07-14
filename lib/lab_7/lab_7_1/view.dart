import 'package:adv_flutter_lab/lab_7/lab_7_1/controller.dart';
import 'package:adv_flutter_lab/utils/import_export.dart';

class RXListView extends StatelessWidget {
  RXListView({super.key});

  RXListController controller = RXListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RXList')),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(title: Text(controller.users[index].toString(),),);
          },
          itemCount: controller.users.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.addIntoList();
      },child: Text('Add'),),
    );
  }
}
