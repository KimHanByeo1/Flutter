import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('체질량지수(Body Mass Index, BMI)란? \n'
                    '키와 몸무게를 이용하여 지방의 양을 추정하는 비만 측정법으로 자신의 몸무게(kg)를 키(m)의 제곱으로 나눈 값입니다. \n'
                    '체질량지수= 몸무게(kg)/키(m)2 우리나라 사람의 경우 BMI 23이상은 과체중이며, \n'
                    'BMI 25이상부터를 비만이라고 합니다. \n'
                    '이 방법은 몸의 지방량을 비교적 정확하게 추정하는 방법이지만, \n'
                    '운동 선수처럼 근육이 많은 사람은 실제보다 몸의 지방이 많은 것으로 계산될 수 있습니다.'),
              ),
              Image.asset(
                'images/bmi.jpeg',
                width: 500,
                height: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
