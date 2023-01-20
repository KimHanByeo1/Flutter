import 'package:flutter/material.dart';
import 'package:textfield_login_data_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'images/login.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    labelText: '사용자 ID를 입력하세요.',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: '사용자 PW를 입력하세요.',
                  ),
                  obscureText: true, // 암호화 텍스트
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (userIdController.text.trim().isEmpty ||
                        passwordController.text.trim().isEmpty) {
                      errorSnackBar(context);
                    } else {
                      if (userIdController.text.trim() == 'root' &&
                          passwordController.text.trim() == 'qwer1234') {
                        _showDialog(context, userIdController.text,
                            passwordController.text);
                      } else {
                        checkSnackBar(context);
                      }
                    }
                  },
                  child: const Text('Log In'))
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions

  // -----------------------------------------
  // Desc : id와 password를 입력 안 했을 경우
  // Date : 2022.12.20
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 Id와 암호를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  // -----------------------------------------
  _showDialog(BuildContext context, String userId, String userPw) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('환영합니다!'),
            content: const Text('신분이 확인 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SecondPage(id: userId, password: userPw);
                    },
                  ));
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  checkSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 Id와 암호를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }
} // End
