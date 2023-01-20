import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/view/home.dart';
import 'package:navigator_lamp_app/view/update_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/updatePage': (context) => const UpdatePage(),
      },
    );
  }
}
