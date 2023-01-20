import 'package:flutter/material.dart';
import 'package:webview_tabbar_class_app/Home.dart';
import 'package:webview_tabbar_class_app/siteName.dart';

class tabbar extends StatefulWidget {
  const tabbar({super.key});

  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> with SingleTickerProviderStateMixin {
  late TabController controller;
  late List siteName;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    siteName = [
      'www.naver.com',
      'www.google.com',
      'www.daum.net',
    ];
  }

// 앱을 종료하기 전
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Home(
            siteName: siteName[0],
          ),
          Home(
            siteName: siteName[1],
          ),
          Home(
            siteName: siteName[2],
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
              ),
              text: '네이버',
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
              ),
              text: '구글',
            ),
            Tab(
              icon: Icon(
                Icons.looks_3,
              ),
              text: '다음',
            ),
          ]),
    );
  }
}
