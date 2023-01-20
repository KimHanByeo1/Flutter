import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/editlamp.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String imagePath;

  @override
  void initState() {
    super.initState();
    imagePath = 'images/lamp_off.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, '/edit')
                    .then((value) => rebuild());
              });
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(EditLamp.imagePath),
      ),
    );
  }

// -- Functions
  rebuild() {
    setState(() {});
  }
} // End
