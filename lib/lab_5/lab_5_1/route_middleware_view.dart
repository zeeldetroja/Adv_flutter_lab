import 'package:adv_flutter_lab/utils/import_export.dart';

class RouteMiddlewareView extends StatelessWidget {
  const RouteMiddlewareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get,Route and Middleware')),
      body: Center(child: Text('Get.to and Get.back method')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Are you want to navigate next page ?',
            textCancel: 'Back',
            textConfirm: 'Navigate',
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              Get.toNamed('/routeName');
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
