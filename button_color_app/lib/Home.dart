import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Color buttonColor;
  late String buttonName;
  @override
  void initState() {
    super.initState();
    buttonName = 'Hello';
    buttonColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change button color & text'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _onClick();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          child: Text(
            buttonName,
          ),
        ),
      ),
    );
  }

  // ---- function ---
  _onClick() {
    setState(() {
      // 빌드에 알려줘야 상태 변환이 됨.
      if (buttonName == 'Hello') {
        buttonName = 'Flutter';
        buttonColor = Colors.orange;
      } else {
        buttonName = 'Hello';
        buttonColor = Colors.blue;
      }
    });
  }
} // End
