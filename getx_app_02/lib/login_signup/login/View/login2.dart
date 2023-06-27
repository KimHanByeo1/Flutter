import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:getx_app_02/login_signup/login/Widget/bottomButton.dart';
import 'package:getx_app_02/login_signup/login/Widget/button.dart';
import 'package:getx_app_02/login_signup/login/Widget/textField.dart';

class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    StreamController<List> controller = StreamController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          LoginTextField(),
          SizedBox(
            height: 10,
          ),
          LoginButton(),
          SizedBox(
            height: 10,
          ),
          LoginBottomButton(),
        ],
      ),
    );
  }
}
