import 'package:collection_view_label_app/model/heroListC.dart';

class Message {
  static String heroName = '';
  static String heroImage = '';
  static bool action = false;

  static List heroList = [
    HeroList(heroName: '유비', heroImage: 'images/pikachu1.png'),
    HeroList(heroName: '관우', heroImage: 'images/pikachu2.png'),
    HeroList(heroName: '장비', heroImage: 'images/pikachu3.png'),
  ];
}
