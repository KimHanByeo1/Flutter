import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_obx_app/controller.dart';

class PersonalCard extends StatelessWidget {
  PersonalCard({super.key});
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF89dad0)),
              child: Center(
                  child: GetX<Controller>(
                      builder: (_) =>
                          Text('Name: ${controller.person().name}'))),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF89dad0)),
              child: Center(
                  child: Obx(() => Text('Age: ${controller.person().age}'))),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF89dad0)),
              child: Center(
                child: GetX(
                  init: Controller(),
                  builder: (controller) => Text(
                    'Age: ${Get.find<Controller>().person().age}',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateInfo();
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
