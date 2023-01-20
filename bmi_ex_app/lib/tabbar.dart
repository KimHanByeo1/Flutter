import 'package:bmi_ex_app/CalcBMI.dart';
import 'package:bmi_ex_app/Home.dart';
import 'package:bmi_ex_app/resultPage.dart';
import 'package:bmi_ex_app/resultPage2.dart';
import 'package:flutter/material.dart';

class tabbarView extends StatefulWidget {
  const tabbarView({super.key});

  @override
  State<tabbarView> createState() => _tabbarViewState();
}

class _tabbarViewState extends State<tabbarView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: const [
          Home(),
          CalcBMI(),
          resultPage2(),
        ],
      ),
      bottomNavigationBar: Container(
        // height: 100,
        child: TabBar(
            controller: controller,
            labelColor: Colors.blue,
            indicatorColor: Colors.red,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.home,
                ),
                text: 'Home',
              ),
              Tab(
                icon: Icon(
                  Icons.calculate,
                ),
                text: 'BMI 계산',
              ),
              Tab(
                icon: Icon(
                  Icons.abc,
                ),
                text: '결과',
              ),
            ]),
      ),
    );
  }
}
