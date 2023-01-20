import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/message.dart';
import 'package:listview_insert_app/model/todo_list.dart';

class insertList extends StatefulWidget {
  const insertList({super.key});

  @override
  State<insertList> createState() => _insertListState();
}

class _insertListState extends State<insertList> {
  late TextEditingController textEditingController;
  late List switchList;
  late bool checkBox;
  late String imageResult;
  late String animal;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchList = [true, false, false];
    checkBox = false;
    imageResult = '';
    animal = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
                const Text('양서류'),
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
                const Text(' 파충류'),
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
                const Text(' 포유류'),
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('날 수 있나요?'),
                const SizedBox(
                  width: 150,
                ),
                Checkbox(
                  value: checkBox,
                  onChanged: (value) {
                    setState(() {
                      checkBox = value!;
                    });
                  },
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      imageAction(1);
                    },
                    child: Image.asset(
                      'images/bee.png',
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      imageAction(2);
                    },
                    child: Image.asset(
                      'images/cat.png',
                      width: 100,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        imageAction(3);
                      },
                      child: Image.asset(
                        'images/cow.png',
                        width: 100,
                      )),
                  GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Image.asset(
                        'images/dog.png',
                        width: 100,
                      )),
                  GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Image.asset(
                        'images/fox.png',
                        width: 100,
                      )),
                  GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Image.asset(
                        'images/monkey.png',
                        width: 100,
                      )),
                  GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Image.asset(
                        'images/pig.png',
                        width: 100,
                      )),
                  GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Image.asset(
                        'images/wolf.png',
                        width: 100,
                      )),
                ],
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
                '동물 추가하기',
              ),
            )
          ],
        ),
      ),
    );
  }

// --- Functions

  imageAction(index) {
    if (index == 1) {
      imageResult = 'images/bee.png';
    } else if (index == 2) {
      imageResult = 'images/cat.png';
    } else if (index == 3) {
      imageResult = 'images/cow.png';
    } else if (index == 4) {
      imageResult = 'images/dog.png';
    } else if (index == 5) {
      imageResult = 'images/fox.png';
    } else if (index == 6) {
      imageResult = 'images/monkey.png';
    } else if (index == 7) {
      imageResult = 'images/pig.png';
    } else if (index == 8) {
      imageResult = 'images/wolf.png';
    }
  }

  addAction() {
    if (switchList[0] == true) {
      animal = Message.animalList = '양서류';
    } else if (switchList[1] == true) {
      animal = Message.animalList = '파충류';
    } else if (switchList[2] == true) {
      animal = Message.animalList = '포유류';
    }

    if (checkBox == true) {
      Message.checkBox = true;
    }

    showDialog(
        context: context,
        // barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('동물 추가하기'),
            content: Text(
                '이 동물은 ${textEditingController.text} 입니다. \n또 동물의 종류는 $animal 입니다. \n이 동물을 추가하시겠습니까?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  insertAnimal();
                  Navigator.of(ctx).pop();
                },
                child: const Text('예'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('아니오'),
              ),
            ],
          );
        });
  }

  insertAnimal() {
    Message.todoList.add(TodoList(
        imagePath: imageResult, animalList: textEditingController.text));
  }
} // End
