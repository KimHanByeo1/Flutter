import 'package:flutter/material.dart';
import 'package:getx_test_app/controller.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// controller Class에 변수와 메서드에 접근할 수 있는 디펜던시 인젝션을 선언
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // 외부에서 사용할 수 있도록 Controller 인스턴스를 전달함
    // Controller controller = Get.put(Controller());
    // GetBuilder에서 init을 통해 Controller 인스턴스를 생성하여 해당 코드가 무의미해짐

    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // GetBuilder = state가 변할 때 마다 화면에 다시 그려주는 역할
            GetBuilder<Controller>(
              init: Controller(),
              builder: (_) => Text(
                // Controller Class에 접근하여 x의 값을 가져옴
                'Current value is: ${Get.find<Controller>().x}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // controller에 접근하여 increment 메서드를 실행함
                Get.find<Controller>().increment();
              },
              child: const Text('Add number'),
            ),
          ],
        ),
      ),
    );
  }
}
