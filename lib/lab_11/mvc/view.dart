import 'package:adv_flutter_lab/lab_11/mvc/controller.dart';
import 'package:adv_flutter_lab/utils/import_export.dart';

class UserView extends StatelessWidget {
  UserView({super.key});

  Controller cont = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API")),
      body: Obx(() {
        if (cont.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            final user = cont.usersList[index];
            return ListTile(
              title: Text(user.id.toString()),
              subtitle: Text(user.name.toString()),
            );
          },
          itemCount: cont.usersList.length,
        );
      }),
    );
  }
}
