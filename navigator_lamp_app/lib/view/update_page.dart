import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/message.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController textEditingController;
  late bool switchValue;
  late String textValue;
  late String imageValue;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchValue = false;
    textValue = 'off';
    imageValue = 'images/lamp_off.png';
    rebuild();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textValue,
                ),
                Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                      switchFunction();
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Message.imagePath = imageValue;
                Message.textValue = textEditingController.text;
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Functions
  switchFunction() {
    if (switchValue == false) {
      textValue = 'off';
      imageValue = 'images/lamp_off.png';
    } else {
      textValue = 'on';
      imageValue = 'images/lamp_on.png';
    }
  }

  rebuild() {
    setState(() {
      textEditingController.text = Message.textValue;
      if (Message.imagePath == 'images/lamp_on.png') {
        switchValue = true;
        textValue = 'on';
        imageValue = 'images/lamp_on.png';
      } else {
        switchValue = false;
        textValue = 'off';
        imageValue = 'images/lamp_off.png';
      }
    });
  }
} // End
