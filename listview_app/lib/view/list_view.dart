import 'package:flutter/material.dart';
import 'package:listview_app/model/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<TodoList> todoList;
  late String content1;
  late String content2;

  @override
  void initState() {
    super.initState();
    content1 = '';
    content2 = '';
    todoList = [];
    todoList.add(TodoList(imagePath: 'images/bee.png', animalList: '벌'));
    todoList.add(TodoList(imagePath: 'images/cat.png', animalList: '고양이'));
    todoList.add(TodoList(imagePath: 'images/cow.png', animalList: '젖소'));
    todoList.add(TodoList(imagePath: 'images/dog.png', animalList: '강아지'));
    todoList.add(TodoList(imagePath: 'images/fox.png', animalList: '여우'));
    todoList.add(TodoList(imagePath: 'images/monkey.png', animalList: '원숭이'));
    todoList.add(TodoList(imagePath: 'images/pig.png', animalList: '돼지'));
    todoList.add(TodoList(imagePath: 'images/wolf.png', animalList: '늑대'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showDialog(context, index),
            child: SizedBox(
              height: 100,
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      todoList[index].imagePath,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      todoList[index].animalList,
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
    // if (todoList[index].animalList == '벌') {
    //   content1 = '곤충';
    //   content2 = '있습니다.';
    // } else {
    //   content1 = '포유류';
    //   content2 = '없습니다.';
    // }
    index == 0 ? content1 = '곤충' : content1 = '포유류';
    index == 0 ? content2 = '있습니다' : content2 = '없습니다';
    showDialog(
        context: context,
        // barrierDismissible: false, // user must tap the button
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(todoList[index].animalList),
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
                child: const Text('수정하기'),
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
      todoList.removeAt(index);
    });
  }
} // End
