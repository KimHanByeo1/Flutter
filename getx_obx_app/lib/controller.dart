import 'package:get/get.dart';
import 'package:getx_obx_app/model.dart';

class Controller extends GetxController {
  final person = Person().obs; // 데이터를 관찰할 수 있는 observable 이라고 불림

  updateInfo() {
    // person에서 가져온 update 메서드는 state의 value 값을 가져온다.
    person.update((val) {
      val?.age++;
      val?.name = "GetX, Obs Test";
    });
  }
}
