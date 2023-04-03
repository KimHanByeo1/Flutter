import 'package:get/get.dart';
import 'package:getx_app_01/Model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  // getter를 사용하여 cartItems를 초기화 시킨 후 값을 가져와야 한다.
  // cartItems가 업데이트 되면 자동으로 totalPrice 값도 업데이트 된다.
  double get totalPrice => cartItems.fold(0, (e, item) => e + item.price);
  int get count => cartItems.length;

  addToItem(Product product) {
    // 메서드가 호출되면 cartItems가 업데이트 되고
    // CartController를 listen 하고 있는 UI는 어디에 있든지 즉시 업데이트 된다.
    cartItems.add(product);
  }
}
