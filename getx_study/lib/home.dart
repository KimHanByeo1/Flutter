// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/instance_manager.dart';

// import 'controller.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Controller controller = Get.put(Controller());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Getx Test'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: GetX<Controller>(
//                 builder: (controller) {
//                   // ListView는 ShoppingController를 계속 listen 하고 있음
//                   // 데이터가 변경되면 그 즉시 업데이트 해줌
//                   return ListView.builder(
//                     itemCount: controller.model.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: Column(
//                           // crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(controller.model[index].code),
//                             Text(controller.model[index].name),
//                             Text(controller.model[index].phone),
//                             Text(controller.model[index].dept),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () => controller.getJSONData(),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.model.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(controller.model[index].code),
                          Text(controller.model[index].name),
                          Text(controller.model[index].phone),
                          Text(controller.model[index].dept),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => controller.getJSONData(),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
