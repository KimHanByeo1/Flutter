import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  late String buttonName;
  late Color buttonColor;

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
        title: const Text('Change button color & text_02'),
        centerTitle: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _onClick();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          child: Text(buttonName),
        ),
      ),
    );
  }

  // Function
  _onClick() {
    setState(() {
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
