import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CheckController extends GetxController {
  static CheckController instance = Get.find();
  FirebaseAuth authentication = FirebaseAuth.instance;

  checkEmail(String email) {
    
  }
}
