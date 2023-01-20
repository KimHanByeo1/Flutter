import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const home(),
    );
  }
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('대한민국'), // 화면상단 제목
        // const -> final과 비슷함 (바뀌지 않는다.)
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Column Text를 밑으로 하나씩 저장한다 ( 배열 )
          children: const [
            Text('유비'),
            SizedBox(
              height: 50, // Text사이의 간격
            ),
            Text('관우'),
            Text('장비'),
          ],
        ), // child 한명만 선택하겠다.
      ),
    );
  }
}
