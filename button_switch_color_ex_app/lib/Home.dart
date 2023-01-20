import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool switchValue;
  late Color buttonColor;
  @override
  void initState() {
    super.initState();
    switchValue = false;
    buttonColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Changed Button color on Switch'),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _buttonClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
              ),
              child: const Text(
                'Flutter',
              ),
            ),
            Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  _buttonClick();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // --- Fucntion ---
  _buttonClick() {
    setState(() {
      if (buttonColor == Colors.blue) {
        buttonColor = Colors.red;
        switchValue = true;
      } else {
        buttonColor = Colors.blue;
        switchValue = false;
      }
    });
  }
} // End
