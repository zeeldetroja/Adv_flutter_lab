import 'package:adv_flutter_lab/utils/import_export.dart';

class StudentController extends GetxController{
  RxList<StudentModel> students = <StudentModel>[].obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController rollnoController = TextEditingController();

  late StudentRepo _repo;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _repo = StudentRepo();
  }
  
  // Future<void> getAllStudents () async {
    // students.value = await _repo.getAllStudent();
  // }
  
  // Future<void> addStudent(StudentModel data) async{
  //   await _repo.addUser(StudentModel(name: nameController), std)
  // }

}