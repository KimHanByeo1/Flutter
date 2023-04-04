import 'package:get/get.dart';
import 'package:getx_app_02/Model/product_model.dart';
import 'package:getx_app_02/data/services.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // 데이터를 전달 받은 후에 동작을 해야하기 때문에 async, await 키워드를 사용한다
  fetchData() async {
    var products = await Services.fetchProduct();
    // product.isLoading = true.obs;
    if (products != null) {
      productList.value = products;
    }
  }
}
