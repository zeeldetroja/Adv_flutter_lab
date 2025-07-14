import 'package:adv_flutter_lab/utils/import_export.dart';

class StudentController extends GetxController{
  RxList<StudentModel> studentlist = <StudentModel>[].obs;
  late MyDatabase db;

  @override
  void onInit() {
    super.onInit();
    db.initDatabase();
  }

  Future<List<StudentModel>> getAllStudents() async {
    Database db = await MyDatabase().initDatabase();

    List<Map<String,dynamic>> students = await db.rawQuery('SELECT * FROM STUDENT');

    List<StudentModel> studentlist = [];

    for(var element in students){
      studentlist.add(StudentModel().fromMap(element));
    }



    return studentlist;

  }

  Future<void> addStudent(StudentModel model) async {
    Database db = await MyDatabase().initDatabase();

    await db.insert('Student',model.toMap());
  }

}