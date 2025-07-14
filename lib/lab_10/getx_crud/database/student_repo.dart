import 'package:adv_flutter_lab/utils/import_export.dart';

class StudentRepo {
  Future<void> addUser(StudentModel, std) async {
    try {
      MyDatabase myDatabase = MyDatabase();

      Database _db = await myDatabase.initDatabase();
      await _db.insert('STUDENT', std.toJson());
    } catch (e) {
      print(e);
    }
  }

  // Future<List<StudentModel>> getAllStudent() async {
  //   try {
  //     MyDatabase myDatabase = MyDatabase();
  //
  //     Database _db = await myDatabase.initDatabase();
  //     List<Map<String, dynamic>> students = await _db.rawQuery(
  //         "SELECT * FROM STUDENT");
  //     List<StudentModel> studentModels = [];
  //     students.map((std) {
  //       studentModels.add(StudentModel(id: std['id'],
  //         name: std['name'],
  //         rollNo: std['rollNo'],));
  //     },);
  //     return studentModels;
  //   } catch (e) {
  //     print("Error while adding student data :$e");
  //   }
  // }

}
