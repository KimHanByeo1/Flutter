// Model Dart
class Register {
  final int? registerid; //  ? = nullsafty autoincrement라서 ㅇㅇ 값안주고 자동생성이니까 ㅇㅇ
  final String registerContent;
  final String registerSecond;

  // Constructor
  Register(
      {this.registerid,
      required this.registerContent,
      required this.registerSecond});

// dart에서는 중복이름이 안되기 때문에 생성자를 만들어서 쓴다.
  Register.formMap(Map<String, dynamic> res)
      : registerid = res['registerid'],
        registerContent = res['registerContent'],
        registerSecond = res['registerSecond'];

  Map<String, Object?> toMap() {
    return {
      'registerid': registerid,
      'registerContent': registerContent,
      'registerSecond': registerSecond
    };
  }
}
