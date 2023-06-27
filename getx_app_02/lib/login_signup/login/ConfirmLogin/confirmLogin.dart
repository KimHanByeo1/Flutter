import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:getx_app_02/login_signup/login/View/login.dart';
import 'package:getx_app_02/main/View/mypage.dart';
import 'package:get/get.dart';

// class ConfirmLogin extends StatelessWidget {
//   const ConfirmLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return MyPage();
//           } else {
//             return const LoginPage();
//           }
//         },
//       ),
//     );
//   }
// }

class ConfirmController extends GetxController {
  static ConfirmController instance = Get.find();
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
}
