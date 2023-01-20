import 'package:flutter/material.dart';
import 'package:tabbar_ex_app/firstPage.dart';
import 'package:tabbar_ex_app/secondPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('피카츄 이미지 탭바'),
      // ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          SecondPage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: TabBar(
            controller: controller,
            labelColor: Colors.blue,
            indicatorColor: Colors.red,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.looks_one,
                ),
                text: 'Pikachu Scene #1',
              ),
              Tab(
                icon: Icon(
                  Icons.looks_two,
                ),
                text: 'Pikachu Scene #2',
              ),
            ]),
      ),
    );
  }
}
