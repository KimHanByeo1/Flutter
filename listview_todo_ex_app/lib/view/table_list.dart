import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';
import 'package:listview_todo_ex_app/model/todo_list.dart';
import 'package:listview_todo_ex_app/view/detail_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList
        .add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert')
                  .then((value) => rebuildData());
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Message.workList = todoList[index].workList;
                Message.imagePath = todoList[index].imagePath;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailList(),
                  ),
                );
              },
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        todoList[index].imagePath,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(todoList[index].workList),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // --- Functions
  rebuildData() {
    setState(() {
      if (Message.state == true) {
        todoList.add(
            TodoList(imagePath: Message.imagePath, workList: Message.workList));
        Message.state = false;
      }
    });
  }
} // End
