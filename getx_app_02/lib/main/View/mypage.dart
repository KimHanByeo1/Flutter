import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_02/login_signup/Signup/Controller/authController.dart';
import 'package:getx_app_02/main/Controller/controller.dart';
import 'package:getx_app_02/main/View/product_tile.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {
              AuthController.instance.logout();
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Obx(
          () {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ProductTile(
                  controller.productList[index],
                );
              },
              itemCount: controller.productList.length,
            );
          },
        ),
      ),
    );
  }
}
