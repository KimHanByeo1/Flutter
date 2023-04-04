import 'package:get/get.dart';
import 'package:getx_app_01/Model/product.dart';

class ShoppingController extends GetxController {
  // 데이터가 변경될 때마다 UI를 자동으로 업데이트 해줘야하기 때문에 옵저버블로 List를 구성함
  var products = <Product>[].obs;

  // controller가 생성될 때 자동으로 실행됨
  @override
  onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    var productData = [
      Product(
        id: 1,
        productName: 'Mouse',
        productDescription: 'some description about product',
        price: 30,
      ),
      Product(
        id: 2,
        productName: 'Keyboard',
        productDescription: 'some description about product',
        price: 40,
      ),
      Product(
        id: 3,
        productName: 'Monitor',
        productDescription: 'some description about product',
        price: 620,
      ),
      Product(
        id: 4,
        productName: 'Ram',
        productDescription: 'some description about product',
        price: 80,
      ),
      Product(
        id: 5,
        productName: 'Speaker',
        productDescription: 'some description about product',
        price: 120.5,
      ),
    ];

    // 현재 리스트에 있는 데이터들을 인자값으로 받는 데이터로 변환하여 대체 함
    products.assignAll(productData);
  }
}
