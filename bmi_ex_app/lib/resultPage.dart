import 'package:flutter/material.dart';

class resultPage extends StatefulWidget {
  const resultPage({super.key});

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/image05.jpeg',
              height: 300,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '하루 1시간의 운동과 적절한 식단으로 충분히 건장한 몸으로 다시 성장할 수 있습니다. \n노력하면 무엇이든 할 수 있습니다 ㅎㅇㅌ!!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
