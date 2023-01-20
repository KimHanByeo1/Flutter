import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late String imagePath;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    imagePath = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/updatePage')
                  .then((value) => rebuild());
              Message.textValue = textEditingController.text;
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: textEditingController,
                // readOnly: true,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요.',
                ),
              ),
            ),
            Image.asset(
              Message.imagePath,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions
  rebuild() {
    setState(() {
      textEditingController.text = Message.textValue;
    });
  }
} // End
