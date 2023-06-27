import 'package:flutter/material.dart';
import 'package:getx_app_02/component/TextField.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({super.key});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late TextEditingController idController;
  late TextEditingController pwController;
  late bool seePassword;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
    seePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                seePassword == true ? seePassword = false : seePassword = true;
              });
            },
            icon: const Icon(
              Icons.remove_red_eye_rounded,
            ),
            color: seePassword == true ? Colors.grey : Colors.blue,
          ),
        ),
      ],
    );
  }
}
