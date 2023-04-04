class Model {
  final String code;
  final String phone;
  final String name;
  final String dept;

  Model({
    required this.code,
    required this.phone,
    required this.name,
    required this.dept,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      code: json['code'],
      phone: json['phone'],
      name: json['name'],
      dept: json['dept'],
    );
  }
}
