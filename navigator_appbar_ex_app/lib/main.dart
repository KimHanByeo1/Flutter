import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/ReceivedMail.dart';
import 'package:navigator_appbar_ex_app/mail.dart';
import 'package:navigator_appbar_ex_app/sendMail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Mail(),
        '/SendMail': (context) => const SendMail(),
        '/ReceivedMail': (context) => const ReceivedMail(),
      },
    );
  }
}
