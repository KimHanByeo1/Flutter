import 'package:flutter/material.dart';
import 'package:getx_app_02/Model/product_model.dart';
import 'package:getx_app_02/View/mypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    late Product product;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}
