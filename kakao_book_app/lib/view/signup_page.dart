import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_book_app/model/message.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController idController;
  late TextEditingController pwController;
  late TextEditingController pwController2;
  late TextEditingController nameController;
  late TextEditingController emailController;

  late String userId;
  late String userPw;
  late String userPw2;
  late String userName;
  late String userEmail;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
    pwController2 = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: Colors.black38,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Colors.grey,
                        height: 50,
                        width: 220,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            color: Colors.white60,
                            child: TextField(
                              controller: idController,
                              decoration: const InputDecoration(
                                labelText: '?????????',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userId = idController.text;
                        idCheck();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(81, 50),
                          backgroundColor: Colors.black38),
                      child: const Text(
                        '????????????',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    color: Colors.grey,
                    height: 50,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Colors.white60,
                        child: TextField(
                          obscureText: true,
                          controller: pwController,
                          decoration: const InputDecoration(
                            labelText: '????????????',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    color: Colors.grey,
                    height: 50,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Colors.white60,
                        child: TextField(
                          obscureText: true,
                          controller: pwController2,
                          decoration: const InputDecoration(
                            labelText: '???????????? ??????',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    color: Colors.grey,
                    height: 50,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Colors.white60,
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: '??????',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    color: Colors.grey,
                    height: 50,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Colors.white60,
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: '?????????',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      userId = idController.text;
                      userPw = pwController.text;
                      userPw2 = pwController2.text;
                      userName = nameController.text;
                      userEmail = emailController.text;
                      _signUp();
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        backgroundColor: Colors.black38),
                    child: const Text(
                      '????????????',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Functions
  idCheck() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/signup_idCheck_flutter.jsp?userId=$userId');
    var count = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(count.bodyBytes));
    List result = dataConvertedJSON['results'];
    // print(count.body);

    // id pw??? ????????????????????? ?????? ?????? ?????? ??? if??? ??????
    if (userId.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '???????????? ???????????????.',
          ),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.blue,
        ),
      );
    } else if (result[0]['count'] == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '?????? ????????? ????????? ?????????.',
          ),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.blue,
        ),
      );
      Message.signUpIdCheck = true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '?????? ???????????? ????????? ?????????.',
          ),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
        ),
      );
      Message.signUpIdCheck = false;
    }
  }

  _signUp() async {
    if (userPw == userPw2 && Message.signUpIdCheck == true) {
      var url = Uri.parse(
          'http://localhost:8080/Flutter/signUp_flutter.jsp?userId=$userId&userPw=$userPw&userName=$userName&userEmail=$userEmail');
      await http.get(url);
      _showDialog(context);
    } else if (userPw != userPw2) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('error'),
            content: const Text('??????????????? ???????????? ????????????.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('error'),
            content: const Text('????????? ??????????????? ???????????????.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('????????????'),
          content: const Text('????????? ?????? ???????????????.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
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
