import 'package:flutter/material.dart';
import 'package:semiproject_app/view/home.dart';
import 'package:semiproject_app/view/register_recipe_page2.dart';
import 'package:semiproject_app/view/register_recipe_page.dart';

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
        '/registerPage': (context) => const RegisterPage(),
        '/registerPage2': (context) => const RegisterPage2(),
      },
    );
  }
}
