import 'package:get/get.dart';

// Controller

class Controller extends GetxController {
  // 외부 클래스에서 x의 값을 불러오고 싶을 때 getter를 사용한다.
  int _x = 0;
  int get x => _x;

  // x의 값을 1씩 증가시키는 메소드
  increment() {
    _x++;

    update(); // *****************
    // update 메서드가 호출이 되어야 외부에서 state가 변경된 것을 알게된다.
    // 변경될 때마다 GetBuilder가 리빌드 된다.
    // update 메서드는 setState와 동일하다.
  }
}
