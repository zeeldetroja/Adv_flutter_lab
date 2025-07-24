class Model {
  int? id;
  String? name;

  Model({this.id, this.name});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      name: json['name'],
    );
  }
}
