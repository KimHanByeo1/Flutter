import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/view/tabbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController idController;
  late TextEditingController pwController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'images/login.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: idController,
                decoration: const InputDecoration(
                  labelText: '사용자 ID 입력하세요.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: pwController,
                decoration: const InputDecoration(
                  labelText: '패스워드를 입력하세요.',
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 아이디 패스워드가 입력이 안 되었을 경우
                if (idController.text.trim().isEmpty ||
                    pwController.text.trim().isEmpty) {
                  errorSnackBar(context);
                } else {
                  // 아이디 패스워드가 정확하게 입력이 되었을 경우
                  if (idController.text.trim() == 'root' &&
                      pwController.text.trim() == 'qwer1234') {
                    _showDialog(context);
                  } else {
                    checkSnackBar(context);
                  }
                }
              },
              child: const Text(
                'Log In',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -- Functions
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '사용자 아이디와 패스워드를 입력하세요.',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('환영 합니다!'),
          content: const Text('신분이 확인 되었습니다.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Home();
                  },
                ));
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }

  checkSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '사용자 아이디와 패스워드를 입력하세요.',
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }
} // End
