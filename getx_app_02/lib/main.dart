import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getx_app_02/firebase_options.dart';
import 'package:getx_app_02/login_signup/Signup/Controller/authController.dart';
import 'package:get/get.dart';
import 'package:getx_app_02/login_signup/login/View/login.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'getx',
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) => Get.put(AuthController()),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: MyPage(),
      home: const LoginPage(),
    );
  }
}
