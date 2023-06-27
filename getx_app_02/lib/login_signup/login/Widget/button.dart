import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // checkIDnPW();
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
      ],
    );
  }
}
