import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1;
  late TextEditingController num2;
  late TextEditingController addText;
  late TextEditingController subText;
  late TextEditingController mulText;
  late TextEditingController divText;
  late double div;

  @override
  void initState() {
    super.initState();
    num1 = TextEditingController();
    num2 = TextEditingController();
    addText = TextEditingController();
    subText = TextEditingController();
    mulText = TextEditingController();
    divText = TextEditingController();
    div = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: num1,
                  decoration: const InputDecoration(
                    labelText: '첫번째 숫자를 입력하세요.',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: num2,
                  decoration: const InputDecoration(
                    labelText: '두번째 숫자를 입력하세요.',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (num1.text.trim().isEmpty ||
                              num2.text.trim().isEmpty) {
                            snackBar(context);
                          } else {
                            calcul();
                          }
                        });
                      },
                      child: const Text(
                        '계산하기',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        deleteText();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        '지우기',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: addText,
                  decoration: const InputDecoration(
                    labelText: '덧셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: subText,
                  decoration: const InputDecoration(
                    labelText: '뺄셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: mulText,
                  decoration: const InputDecoration(
                    labelText: '곱셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: divText,
                  decoration: const InputDecoration(
                    labelText: '나눗셈 결과',
                  ),
                  readOnly: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----- Function ----
  calcul() {
    addText.text = '${int.parse(num1.text) + int.parse(num2.text)}';
    subText.text = '${int.parse(num1.text) - int.parse(num2.text)}';
    mulText.text = (int.parse(num1.text) * int.parse(num2.text)).toString();
    divText.text =
        (double.parse(num1.text) / double.parse(num2.text)).toStringAsFixed(2);
  }

  deleteText() {
    num1.text = '';
    num2.text = '';
    addText.text = '';
    subText.text = '';
    mulText.text = '';
    divText.text = '';
  }

  snackBar(BuildContext context) {
    late String textValue;
    if (num1.text.trim().isEmpty) {
      textValue = '첫번째';
    } else {
      textValue = '두번째';
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$textValue 숫자를 입력하세요!'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
} // End
