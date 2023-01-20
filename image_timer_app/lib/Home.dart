import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List imagesFile;
  late int currentPage;

  @override
  void initState() {
    super.initState();
    imagesFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    currentPage = 0;

    // Timer 설치
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한반복'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              imagesFile[currentPage],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Image.asset(
              'images/${imagesFile[currentPage]}',
              width: 400,
              height: 600,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  changeImage() {
    setState(() {
      currentPage++;
      if (currentPage >= imagesFile.length) {
        currentPage = 0;
      }
    });
  }
} // End
