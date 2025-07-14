import 'package:adv_flutter_lab/utils/import_export.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Data'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
