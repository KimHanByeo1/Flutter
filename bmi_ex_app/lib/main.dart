import 'package:bmi_ex_app/CalcBMI.dart';
import 'package:bmi_ex_app/resultPage.dart';
import 'package:bmi_ex_app/resultPage2.dart';
import 'package:bmi_ex_app/tabbar.dart';
import 'package:flutter/material.dart';

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
        '/': (context) => const tabbarView(),
        '/CalcBMI': (context) => const CalcBMI(),
        '/resultPage': (context) => const resultPage(),
        '/resultPage2': (context) => const resultPage2(),
      },
    );
  }
}
