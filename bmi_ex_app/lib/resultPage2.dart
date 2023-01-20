import 'package:flutter/material.dart';

class resultPage2 extends StatefulWidget {
  const resultPage2({super.key});

  @override
  State<resultPage2> createState() => _resultPage2State();
}

class _resultPage2State extends State<resultPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'images/image05.jpeg',
                height: 300,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  '하루 1시간의 운동과 적절한 식단으로 충분히 건장한 몸으로 다시 성장할 수 있습니다.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                'images/image06.png',
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
