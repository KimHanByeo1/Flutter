import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text(
            'Hello world',
          ),
        ),
      ),
    );
  }
// ------- function ---------

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Alert Title'),
            content: const Text('Hello World를 Touch했습니다.'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('종료'))
            ],
          );
        });
  }
} // end

