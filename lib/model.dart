class BoolsModel {
  String name;
  int age;
  int mobile;
  String documentUid;

  BoolsModel({
    required this.name,
    required this.age,
    required this.mobile,
    required this.documentUid,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'mobile': mobile,
        'documentUid': documentUid,
      };

  factory BoolsModel.fromJson(json) => BoolsModel(
        name: json['name'],
        age: json['age'],
        mobile: json['mobile'],
        documentUid: json['documentUid'],
      );
}
