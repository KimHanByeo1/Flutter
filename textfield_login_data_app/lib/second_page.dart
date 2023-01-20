import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String id;
  final String password;

  const SecondPage({super.key, required this.id, required this.password});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

// 상속받은 클래스만 위젯을 사용할 수 있다. ex) State<SecondPage> << 최상단 class SecondPage
class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${widget.id}님 환영 합니다. ${widget.password}'),
      ),
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('images/bitcoin.jpg'),
          radius: 100,
        ),
      ),
    );
  }
}
