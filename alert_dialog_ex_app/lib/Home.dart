// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert and push'),
        centerTitle: false,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text(
            'Move the 2nd page.',
          ),
        ),
      ),
    );
  }

// ----- function -----
  _showDialog(context) {
    showDialog(
        context: context,
        // barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Page 이동'),
            content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Navigator.pushNamed(context, '/secondPage');
                  },
                  child: const Text('Page 이동'))
            ],
          );
        });
  }
} // End
