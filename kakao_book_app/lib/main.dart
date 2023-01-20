import 'package:flutter/material.dart';
import 'package:kakao_book_app/home.dart';
import 'package:kakao_book_app/view/cart_page.dart';
import 'package:kakao_book_app/view/login_page.dart';
import 'package:kakao_book_app/view/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/cartPage': (context) => const CartPage(),
        '/loginPage': (context) => const LoginPage(),
        '/signUpPage': (context) => const SignUpPage(),
      },
    );
  }
}
