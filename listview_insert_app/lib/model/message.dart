import 'package:listview_insert_app/model/todo_list.dart';

class Message {
  static List<TodoList> todoList = [
    TodoList(imagePath: 'images/bee.png', animalList: '벌'),
    TodoList(imagePath: 'images/cat.png', animalList: '고양이'),
    TodoList(imagePath: 'images/cow.png', animalList: '젖소'),
    TodoList(imagePath: 'images/dog.png', animalList: '강아지'),
    TodoList(imagePath: 'images/fox.png', animalList: '여우'),
    TodoList(imagePath: 'images/monkey.png', animalList: '원숭이'),
    TodoList(imagePath: 'images/pig.png', animalList: '돼지'),
    TodoList(imagePath: 'images/wolf.png', animalList: '늑대'),
  ];
  static String animalList = '';
  static String imagePath = '';
  static bool state = false;
  static bool checkBox = false;
}
