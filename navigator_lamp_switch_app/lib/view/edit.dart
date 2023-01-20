import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/editlamp.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  EditLamp.text1,
                ),
                Switch(
                  value: EditLamp.switchValue1,
                  onChanged: (value) {
                    setState(() {
                      EditLamp.switchValue1 = value;
                      switchAction1();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  EditLamp.text2,
                ),
                Switch(
                  value: EditLamp.switchValue2,
                  onChanged: (value) {
                    setState(() {
                      EditLamp.switchValue2 = value;
                      switchAction2();
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                switchAction2();
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

  // --- Functions
  switchAction1() {
    EditLamp.switchValue1 == false
        ? EditLamp.text1 = 'Red'
        : EditLamp.text1 = 'Yellow';
  }

  switchAction2() {
    if (EditLamp.switchValue2 == false) {
      EditLamp.text2 = 'off';
      EditLamp.imagePath = 'images/lamp_off.png';
    } else {
      EditLamp.text2 = 'on';
      if (EditLamp.switchValue1 == false) {
        EditLamp.text1 = 'Red';
        EditLamp.imagePath = 'images/lamp_red.png';
      } else {
        EditLamp.text1 = 'Yellow';
        EditLamp.imagePath = 'images/lamp_on.png';
      }
    }
  }

  lampState() {
    setState(() {
      if (EditLamp.imagePath == 'images/lamp_on.png') {
        EditLamp.switchValue1 = true;
        EditLamp.switchValue2 = true;
      } else if (EditLamp.imagePath == 'images/lamp_red.png') {
        EditLamp.switchValue1 = false;
        EditLamp.switchValue2 = true;
      } else if (EditLamp.imagePath == 'images/lamp_off.png') {
        EditLamp.switchValue1 = false;
        EditLamp.switchValue2 = false;
      }
    });
  }
} // End
