import 'package:pickerview_ex_app/model/todolist.dart';

class Message {
  static List<TodoList> list = [
    TodoList(imagePath: 'images/cart.png', textValue: '책구매'),
    TodoList(imagePath: 'images/clock.png', textValue: '철수와 약속'),
    TodoList(imagePath: 'images/pencil.png', textValue: '스터디 준비하기'),
  ];
  static String imagePath = '';
  static String textValue = '';
}
