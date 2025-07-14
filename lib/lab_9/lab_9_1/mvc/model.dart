class StudentModel {
  int? _studentID;

  int? get studentID => _studentID;

  set studentID(int? value) {
    _studentID = value;
  }

  String? _name;

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  int? _enrollmentNo;

  int? get enrollmentNo => _enrollmentNo;

  set enrollmentNo(int? value) {
    _enrollmentNo = value;
  }

  int? _rollNo;

  int? get rollNo => _rollNo;

  set rollNo(int? value) {
    _rollNo = value;
  }

  StudentModel({int? studentID, String? name, int? enrollmentNo, int? rollNo})
    : _studentID = studentID,
      _enrollmentNo = enrollmentNo,
      _name = name,
      _rollNo = rollNo;

  Map<String, Object?> toMap() {
    return {
      'studentID': studentID,
      'name': name,
      'enrollmentNo': enrollmentNo,
      'rollNo': rollNo,
    };
  }

  StudentModel fromMap(Map<String,Object?> studentData){
    return StudentModel(
      studentID: studentData[studentID] as int,
      name: studentData[name].toString(),
      enrollmentNo: studentData[enrollmentNo] as int,
      rollNo: studentData[rollNo] as int,
    );
  }
}
