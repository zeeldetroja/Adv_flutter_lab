import 'package:adv_flutter_lab/utils/import_export.dart';

class ExceptionView extends StatelessWidget {
  ExceptionView({super.key});

  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exception Handling")),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter value of a :'),
              controller: a,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter value of b :'),
              controller: b,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.snackbar('title', 'message');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
