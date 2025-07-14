import 'package:adv_flutter_lab/utils/import_export.dart';

class StudentDatabaseView extends StatelessWidget {
  const StudentDatabaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Database CRUD')),
      body: Column(children: [
        TextFormField(
          decoration: InputDecoration(
            label: Text('Name :'),
          ),
        ),
      ]),
    );
  }
}
