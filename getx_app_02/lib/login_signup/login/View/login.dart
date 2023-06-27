import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getx_app_02/Component/TextField.dart';
import 'package:get/get.dart';
import 'package:getx_app_02/login_signup/Signup/View/SignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController idController;
  late TextEditingController pwController;

  late bool pwCheck;
  late bool saveId;
  late bool autoLogin;
  late bool seePassword;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();

    pwCheck = false;
    saveId = false;
    autoLogin = false;
    seePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextfield(
                controller: idController,
                hintText: "아이디",
                obscureText: false,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextfield(
                controller: pwController,
                hintText: "비밀번호",
                obscureText: seePassword,
                autofocus: false,
                keyboardType: TextInputType.text,
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      seePassword == true
                          ? seePassword = false
                          : seePassword = true;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_rounded,
                  ),
                  color: seePassword == true ? Colors.grey : Colors.blue,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  checkIDnPW();
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(341, 50.0)),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      //
                    },
                    child: const Text(
                      style: TextStyle(color: Colors.black),
                      'ID 찾기',
                    ),
                  ),
                  const Text(' | '),
                  TextButton(
                    onPressed: () {
                      //
                    },
                    child: const Text(
                      style: TextStyle(color: Colors.black),
                      'PW 찾기',
                    ),
                  ),
                  const Text(' | '),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignUp());
                    },
                    child: const Text(
                      style: TextStyle(color: Colors.black),
                      '회원가입',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 체크박스 on, off로 패스워드 보여주기
  showPassword() {
    setState(() {
      if (pwCheck == true) {
        seePassword = false;
      } else {
        seePassword = true;
      }
    });
  }

  checkIDnPW() {
    if (idController.text.trim().isEmpty) {
      loginError('아이디를 입력하세요.');
    } else if (pwController.text.trim().isEmpty) {
      loginError('비밀번호를 입력하세요.');
    } else {
      loginAction();
    }
  }

  // Login
  loginAction() async {
    try {
      print(idController.text.trim());
      print(pwController.text.trim());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: idController.text.trim(), password: pwController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        print("123");
        loginError('존재하지 않는 아이디 입니다.');
      } else if (e.code == 'wrong-password') {
        print("456");
        loginError('비밀번호를 확인하세요.');
      }
    }
  }

  loginError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.pinkAccent,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
