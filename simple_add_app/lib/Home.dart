import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String result;
  late TextEditingController number1;
  late TextEditingController number2;

  @override
  void initState() {
    super.initState();
    result = '';
    number1 = TextEditingController();
    number2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 덧셈 계산기'),
        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                '덧셈 결과 : ${result}',
                style: const TextStyle(fontSize: 20),
              ),
              TextField(
                controller: number1,
                decoration: const InputDecoration(
                  labelText: '첫번째 숫자',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: number2,
                decoration: const InputDecoration(
                  labelText: '두번째 숫자',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  add();
                },
                icon: const Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(380, 40),
                  alignment: Alignment.centerLeft,
                ),
                label: const Text(
                  '덧셈 계산',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Function
  add() {
    setState(() {
      result = '${int.parse(number1.text) + int.parse(number2.text)}';
    });
  }
} // End

// 강사님 ver
class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  late TextEditingController value1;
  late TextEditingController value2;
  late int sum;

  @override
  void initState() {
    super.initState();
    value1 = TextEditingController();
    value2 = TextEditingController();
    sum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 덧셈 계산기'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                '덧셈 결과 : $sum',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                width: 100,
                color: Colors.orange,
                child: TextField(
                  controller: value1,
                  keyboardType: TextInputType.number,
                  readOnly: true,
                ),
              ),
              TextField(
                controller: value2,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    sum = int.parse(value1.text) + int.parse(value2.text);
                  });
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.add,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('덧셈 계산'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
