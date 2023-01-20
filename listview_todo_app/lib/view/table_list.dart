import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';

import 'detail_list.dart';

class TablerList extends StatefulWidget {
  const TablerList({super.key});

  @override
  State<TablerList> createState() => _TablerListState();
}

class _TablerListState extends State<TablerList> {
  late List<TodoList> todoList; //todo_list.dart에 있는 TodoList를 가져오겠다.

  @override
  void initState() {
    // TODO: implement initState
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
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                Message.workList = todoList[position].workList;
                Message.imageList = todoList[position].imagePath;
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
                        todoList[position].imagePath,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(todoList[position].workList),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // -F
  rebuildData() {
    setState(() {
      if (Message.state == true) {
        todoList.add(
            TodoList(imagePath: Message.imageList, workList: Message.workList));
        Message.state = false;
      }
    });
  }
} // End