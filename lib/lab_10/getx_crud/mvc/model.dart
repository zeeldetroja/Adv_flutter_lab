class StudentModel {
  int? id;
  String? rollNo;
  String? name;

  StudentModel({this.id, required this.rollNo, required this.name});

  Map<String, dynamic> toJson(StudentModel, data) {
    return {'id': id, 'name': name, 'rollNo': rollNo};
  }

  StudentModel fromJson(Map<String, dynamic> data) {
    return (StudentModel(
      id: data['id'],
      name: data['name'],
      rollNo: data['rollNo'],
    ));
  }
}
