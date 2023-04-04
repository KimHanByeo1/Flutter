import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_02/Controller/controller.dart';
import 'package:getx_app_02/View/product_tile.dart';

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
              //
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Container(
        child: Padding(
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
      ),
    );
  }
}
