import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_01/Controller/cart_controller.dart';
import 'package:getx_app_01/Controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                // ListView는 ShoppingController를 계속 listen 하고 있음
                // 데이터가 변경되면 그 즉시 업데이트 해줌
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(controller
                                        .products[index].productDescription),
                                  ],
                                ),
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToItem(controller.products[index]);
                                },
                                child: const Text('Add to cart'))
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text(
                'Total amount \$ ${controller.totalPrice}',
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              );
            },
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      // floatingActionButton이 리빌드 될 필요가 없으므로 Text 위젯만 GetX로 감싸준다.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //
        },
        label: GetX<CartController>(builder: (controller) {
          return Text(
            cartController.count.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          );
        }),
        icon: const Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
