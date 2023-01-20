import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/model/message.dart';
import 'package:navigator_tabbar_ex_app/model/todo_list.dart';

class AnimalList extends StatefulWidget {
  const AnimalList({super.key});

  @override
  State<AnimalList> createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  late String content1;
  late String content2;

  @override
  void initState() {
    super.initState();
    content1 = '';
    content2 = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동물 친구 찾기'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: Message.animalList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _listClick(index);
            },
            child: SizedBox(
              height: 100,
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      Message.animalList[index].imagePath,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      Message.animalList[index].animalList,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }

  // --- Functions
  _listClick(index) {
    index == 0 ? content1 = '곤충' : content1 = '포유류';
    index == 0 ? content2 = '있습니다' : content2 = '없습니다';
    showDialog(
        context: context,
        // barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(Message.animalList[index].animalList),
            content: Text('이 동물은 $content1 입니다. \n날 수 $content2'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  remove(index);
                  Navigator.of(ctx).pop();
                },
                child: const Text('삭제'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('확인'),
              ),
            ],
          );
        });
  }

  remove(index) {
    setState(() {
      Message.animalList.removeAt(index);
    });
  }
} // End
