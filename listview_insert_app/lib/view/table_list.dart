import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/message.dart';

// ignore: camel_case_types
class tableList extends StatefulWidget {
  const tableList({super.key});

  @override
  State<tableList> createState() => _HomeState();
}

class _HomeState extends State<tableList> {
  // late List<TodoList> todoList;
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
      body: Center(
          child: ListView.builder(
        itemCount: Message.todoList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showDialog(context, index),
            child: SizedBox(
              height: 100,
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      Message.todoList[index].imagePath,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      Message.todoList[index].animalList,
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

  // --- Functions ---
  _showDialog(context, index) {
    index == 0 ? content1 = '곤충' : content1 = '포유류';
    index == 0 ? content2 = '있습니다' : content2 = '없습니다';
    showDialog(
        context: context,
        // barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(Message.todoList[index].animalList),
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

  // Functions
  remove(index) {
    setState(() {
      Message.todoList.removeAt(index);
    });
  }
} // End
