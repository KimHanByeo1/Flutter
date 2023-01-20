import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickerview_ex_app/model/message.dart';
import 'package:pickerview_ex_app/model/todolist.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  late int selectedItem;
  late List imageList = [
    'images/cart.png',
    'images/clock.png',
    'images/pencil.png',
  ];
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    selectedItem = 0;
    textEditingController = TextEditingController();
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
                Image.asset(
                  '${imageList[selectedItem]}',
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 200,
                    height: 150,
                    child: CupertinoPicker(
                        itemExtent: 30,
                        scrollController:
                            FixedExtentScrollController(initialItem: 0),
                        onSelectedItemChanged: (value) {
                          setState(() {
                            selectedItem = value;
                          });
                        },
                        children: [
                          Image.asset(imageList[0]),
                          Image.asset(imageList[1]),
                          Image.asset(imageList[2]),
                        ]),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '목록을 입력하세요.',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                addAction();
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
  addAction() {
    Message.list.add(
      TodoList(
        imagePath: imageList[selectedItem],
        textValue: textEditingController.text,
      ),
    );
    Navigator.pushNamed(context, '/');
  }
} // End
