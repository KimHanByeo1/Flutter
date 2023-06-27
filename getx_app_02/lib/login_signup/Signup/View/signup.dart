import 'package:flutter/material.dart';
import 'package:getx_app_02/component/TextField.dart';
import 'package:getx_app_02/login_signup/Signup/Controller/authController.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController emailController;
  late TextEditingController pwController;
  late TextEditingController confirmPwController;

  final FocusNode _idTextNode = FocusNode();
  final FocusNode _pwTextNode = FocusNode();
  final FocusNode _confirmPwTextNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    pwController = TextEditingController();
    confirmPwController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawKeyboardListener(
              focusNode: _idTextNode,
              onKey: (value) {
                // getData();
              },
              child: MyTextfield(
                controller: emailController,
                hintText: 'email',
                obscureText: false,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RawKeyboardListener(
              focusNode: _pwTextNode,
              onKey: (value) {
                // getData();
              },
              child: MyTextfield(
                controller: pwController,
                hintText: 'password',
                obscureText: false,
                autofocus: false,
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RawKeyboardListener(
              focusNode: _confirmPwTextNode,
              onKey: (value) {
                // getData();
              },
              child: MyTextfield(
                controller: confirmPwController,
                hintText: 'confirm password',
                obscureText: false,
                autofocus: false,
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                AuthController.instance.register(
                  emailController.text.trim(),
                  pwController.text.trim(),
                );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(341, 50.0)),
              ),
              child: const Text(
                'SignUp',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
