import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late String sum;

  @override
  void initState() {
    super.initState();
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    sum = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('덧셈 구하기'),
          centerTitle: false,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: textEditingController1,
                  decoration: const InputDecoration(
                    labelText: '첫번째 숫자를 입력하세요',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: textEditingController2,
                  decoration: const InputDecoration(
                    labelText: '두번째 숫자를 입력하세요',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (textEditingController1.text.trim().isEmpty ||
                        textEditingController2.text.trim().isEmpty) {
                      errorText(context);
                    } else {
                      showText();
                    }
                  },
                  child: const Text(
                    '덧셈 계산',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  sum,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // -- Function --
  showText() {
    setState(() {
      sum =
          '입력하신 숫자의 합은 ${int.parse(textEditingController1.text) + int.parse(textEditingController2.text)} 입니다.';
    });
  }

  errorText(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
} // End
