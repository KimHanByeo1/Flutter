import 'package:flutter/material.dart';
import 'package:listview_insert_app/view/insert_list.dart';
import 'package:listview_insert_app/view/table_list.dart';

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
      appBar: AppBar(
        title: const Text('Listview Test'),
        centerTitle: false,
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          tableList(),
          insertList(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        indicatorColor: Colors.red,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
