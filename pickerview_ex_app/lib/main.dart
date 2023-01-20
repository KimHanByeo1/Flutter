import 'package:flutter/material.dart';
import 'package:pickerview_ex_app/view/Home.dart';
import 'package:pickerview_ex_app/view/add_view.dart';

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
        '/addView': (context) => const AddView(),
      },
    );
  }
}
