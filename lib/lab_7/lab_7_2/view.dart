import 'package:adv_flutter_lab/utils/import_export.dart';

class RXListFavView extends StatelessWidget {
  RXListFavView({super.key});

  RXListFavController controller = RXListFavController();

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
