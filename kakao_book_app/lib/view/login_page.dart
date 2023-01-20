import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_book_app/model/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController idController;
  late TextEditingController pwController;
  late String id;
  late String pw;
  late bool pwCheck;
  late bool saveId;
  late bool autoLogin;
  late bool passwordValue;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
    pwCheck = false;
    saveId = false;
    autoLogin = false;
    passwordValue = true;
    if (Message.idCheck == true) {
      _initSharedPreferences();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log In'),
          backgroundColor: Colors.black38,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: Colors.white60,
                      child: TextField(
                        controller: idController,
                        decoration: const InputDecoration(
                          hintText: '아이디',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: Colors.white60,
                      child: TextField(
                        obscureText: passwordValue,
                        controller: pwController,
                        decoration: const InputDecoration(
                          hintText: '패스워드',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: saveId,
                    onChanged: (value) {
                      setState(() {
                        saveId = value!;
                        // _saveId();
                      });
                    },
                  ),
                  const Text(
                    'ID 저장하기',
                  ),
                  Checkbox(
                    value: autoLogin,
                    onChanged: (value) {
                      setState(() {
                        autoLogin = value!;
                        // _saveId();
                      });
                    },
                  ),
                  const Text(
                    '자동 로그인',
                  ),
                  Checkbox(
                    value: pwCheck,
                    onChanged: (value) {
                      setState(() {
                        pwCheck = value!;
                        showPassword();
                      });
                    },
                  ),
                  const Text('패스워드 보기')
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  id = idController.text;
                  pw = pwController.text;
                  loginAction();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black38,
                  minimumSize: const Size(370, 50),
                ),
                child: const Text(
                  '로그인',
                ),
              ),
              const SizedBox(
                height: 10,
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
                      Navigator.pushNamed(context, '/signUpPage');
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

  // --- Functions

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idController.text = (prefs.getString('p_userid'))!; // nullsafty 표시해야함
    });
  }

  // Shared 에 저장하기.
  _saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userid', idController.text);
    // pref.setString("p_password", pwController.text);
  }

  // 체크박스 on, off로 패스워드 보여주기
  showPassword() {
    setState(() {
      if (pwCheck == true) {
        passwordValue = false;
      } else {
        passwordValue = true;
      }
    });
  }

  // 로그인 하기
  loginAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/login_flutter.jsp?customerId=$id&customerPw=$pw');
    var count = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(count.bodyBytes));
    List result = dataConvertedJSON['results'];
    // print(count.body);

    // id pw로 데이터베이스에 존재 여부 확인 후 if문 실행
    if (result[0]['count'] == 1) {
      Message.loginCheck = 1;
      Message.customerId = idController.text;

      if (saveId == true) {
        _saveSharedPreferences();
      } else {
        final pref = await SharedPreferences.getInstance();
        pref.clear();
      }

      Navigator.pushNamed(context, '/');
    } else {
      _errorDialog(context);
    }
  }

  _errorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('error'),
          content: const Text('등록 되어있는 회원이 아닙니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.pop(context);
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
} // End
