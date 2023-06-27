import 'package:flutter/material.dart';
import 'package:getx_app_02/component/TextField.dart';

class SignUpTextField extends StatefulWidget {
  const SignUpTextField({super.key});

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  late TextEditingController emailController;
  late TextEditingController pwController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    pwController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextfield(
          controller: emailController,
          hintText: 'email',
          obscureText: false,
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 10,
        ),
        MyTextfield(
          controller: pwController,
          hintText: 'password',
          obscureText: false,
          autofocus: false,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
