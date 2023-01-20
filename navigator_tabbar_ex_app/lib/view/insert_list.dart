import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/model/message.dart';
import 'package:navigator_tabbar_ex_app/model/todo_list.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late List switchList;
  late bool checkValue;
  late String iamgeValue;
  late String animal;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchList = [true, false, false];
    checkValue = false;
    iamgeValue = '';
    animal = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동물 친구 찾기'),
      ),
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
                const Text('영서류'),
                Switch(
                  value: switchList[0],
                  onChanged: (value) {
                    setState(() {
                      switchList = [value, false, false];
                      if (value == false) {
                        switchList = [true, false, false];
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('파충류'),
                Switch(
                  value: switchList[1],
                  onChanged: (value) {
                    setState(() {
                      switchList = [false, value, false];
                      if (value == false) {
                        switchList = [true, false, false];
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('포유류'),
                Switch(
                  value: switchList[2],
                  onChanged: (value) {
                    setState(() {
                      switchList = [false, false, value];
                      if (value == false) {
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
                  value: checkValue,
                  onChanged: (value) {
                    setState(() {
                      checkValue = value!;
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
            ElevatedButton(
              onPressed: () {
                insertAction();
              },
              child: const Text(
                '동물 추가하기',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions
  imageAction(index) {
    if (index == 1) {
      iamgeValue = 'images/bee.png';
    } else if (index == 2) {
      iamgeValue = 'images/cat.png';
    } else if (index == 3) {
      iamgeValue = 'images/cow.png';
    }
  }

  insertAction() {
    if (switchList[0] == true) {
      animal = '양서류';
    } else if (switchList[1] == true) {
      animal = '파충류';
    } else if (switchList[2] == true) {
      animal = '포유류';
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
    Message.animalList.add(TodoList(
        imagePath: iamgeValue, animalList: textEditingController.text));
  }
} // End
