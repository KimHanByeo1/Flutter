import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_02/login_signup/login/View/login.dart';
import 'package:getx_app_02/main/View/mypage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => MyPage());
    }
  }

  register(String email, password) async {
    try {
      await authentication.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar('Error message', 'Error message',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Registration is failed',
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }

  logout() {
    authentication.signOut();
  }
}
