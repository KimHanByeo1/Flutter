import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/view/edit.dart';
import 'package:navigator_lamp_switch_app/view/home.dart';

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
        '/edit': (context) => const Edit(),
      },
    );
  }
}
