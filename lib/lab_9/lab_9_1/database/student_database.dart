import 'package:adv_flutter_lab/utils/import_export.dart';

class StudentDatabase {
  Future<Database> initDatabase() async {
    return await openDatabase(
      '${getDatabasesPath()}+/StudentDB',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE STUDENT('
          'StudentID INTEGER PRIMARY KEY AUTOINCREMENT,'
          'Name TEXT,'
          'EnrollmentNo INTEGER,'
          'RollNO INTEGER)',
        );
      },
    );
  }

  Future<void> insertStudentData(student) async {
    final db = await StudentDatabase().initDatabase();
    await db.insert('STUDENT', student);
  }


}
