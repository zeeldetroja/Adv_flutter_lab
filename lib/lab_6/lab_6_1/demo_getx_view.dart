import 'package:adv_flutter_lab/lab_6/lab_6_1/demo_getx_controller.dart';
import 'package:adv_flutter_lab/utils/import_export.dart';

class DemoGetxView extends StatelessWidget {
  DemoGetxView({super.key});

  DemoGetxController demoGetxController = DemoGetxController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DemoGetxController>(
        init: DemoGetxController(),
        builder: (controller) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(title: Text(controller.items[index].toString()));
            },
            itemCount: controller.items.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // demoGetxController.addItemInList();
      },),
    );
  }
}
