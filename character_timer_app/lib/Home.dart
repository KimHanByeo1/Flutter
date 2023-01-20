import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String str;
  late String list2;
  late String num1;
  List list = [];
  int currentCharacter = 0;
  final timer = Timer(const Duration(seconds: 1), () => null);

  @override
  void initState() {
    super.initState();
    str = '대한민국';
    list2 = '';
    list = str.split('');
    num1 = '10';
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   changeText();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'LED 광고',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/image01.png'),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage('images/image02.png'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/image03.png'),
              ),
            ],
            accountName: Text('Pikachu'),
            accountEmail: Text('pikachu@naver.com'),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text('Home'),
            onTap: () {
              print('Home is clicked.');
            },
            trailing: const Icon(
              Icons.add,
            ),
          )
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                buttonclick();
              },
              child: const Text(
                'Button',
              ),
            ),
            Text(
              list2,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              num1,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        // child: Text(
        //   list2,
        //   style: const TextStyle(
        //     fontSize: 30,
        //   ),
        // ),
      ),
    );
  }

// --- Functions ---

  changeText2() {}

  buttonclick() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      changeText();
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      changeNumber();
    });
  }

  changeNumber() {
    setState(() {
      if (num1 == '0') {
        timer.cancel();
      }
      int num2 = int.parse(num1);
      num2--;
      num1 = num2.toString();
    });
  }

  changeText() {
    setState(() {
      if (currentCharacter > 3) {
        list2 = '';
        currentCharacter = 0;
      }
      list2 += str[currentCharacter];
      currentCharacter++;
    });
  }
} // End
