import 'package:adv_flutter_lab/utils/import_export.dart';

class MyDatabase {
  Future<Database> initDatabase() {
    return openDatabase(
      "${getDatabasesPath()}/std.db",
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE STUDENT("
          "STUID INTEGER PRIMARY KEY AUTOINCREMENT,"
          "ROLLNO INTEGER,"
          "NAME TEXT)",
        );
      },
      version: 1,
    );
  }
}
