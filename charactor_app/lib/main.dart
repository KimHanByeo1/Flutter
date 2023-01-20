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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('영웅 Card'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/image04.jpeg'),
                radius: 60,
              ),
              const Divider(
                height: 30,
                color: Colors.grey,
                thickness: 1,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        '성웅',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        '이순신 장군',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        '전적',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        '62전 62승',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text('옥포해전'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text('사천포해전'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text('당포해전'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text('한산도대첩'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text('부산포해전'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text('명량해전'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text('노량해전'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/image2.gif',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
