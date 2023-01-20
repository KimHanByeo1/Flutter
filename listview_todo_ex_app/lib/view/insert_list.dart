import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late List switchList;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchList = [true, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('구매'),
                Switch(
                  value: switchList[0],
                  onChanged: (value) {
                    setState(() {
                      switchList = [value, false, false];
                      if (value = false) {
                        switchList = [true, false, false];
                      }
                    });
                  },
                ),
                Image.asset(
                  'images/cart.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('약속'),
                Switch(
                  value: switchList[1],
                  onChanged: (value) {
                    setState(() {
                      switchList = [false, value, false];
                      if (value = false) {
                        switchList = [true, false, false];
                      }
                    });
                  },
                ),
                Image.asset(
                  'images/clock.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('스터디'),
                Switch(
                  value: switchList[2],
                  onChanged: (value) {
                    setState(() {
                      switchList = [false, false, value];
                      if (value = false) {
                        switchList = [true, false, false];
                      }
                    });
                  },
                ),
                Image.asset(
                  'images/pencil.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: '목록을 입력하세요',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (textEditingController.text.trim().isNotEmpty) {
                        actionSwitch();
                      }
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'OK',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // --- Functions
  actionSwitch() {
    if (switchList[0] == true) {
      Message.imagePath = 'images/cart.png';
    } else if (switchList[1] == true) {
      Message.imagePath = 'images/clock.png';
    } else if (switchList[2] == true) {
      Message.imagePath = 'images/pencil.png';
    }

    Message.workList = textEditingController.text.trim();
    Message.state = true;
  }
} // End
