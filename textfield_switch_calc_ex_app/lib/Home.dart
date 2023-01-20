import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1;
  late TextEditingController num2;
  late TextEditingController addition;
  late TextEditingController subtraction;
  late TextEditingController multiplication;
  late TextEditingController division;
  late bool addSwitch;
  late bool subSwitch;
  late bool mulSwitch;
  late bool divSwitch;

  @override
  void initState() {
    super.initState();
    num1 = TextEditingController();
    num2 = TextEditingController();
    addition = TextEditingController();
    subtraction = TextEditingController();
    multiplication = TextEditingController();
    division = TextEditingController();
    addSwitch = false;
    subSwitch = false;
    mulSwitch = false;
    divSwitch = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('계산기'),
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
                  height: 15,
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
                            // calcul();
                            addFunc();
                            subFunc();
                            mulFunc();
                            divFunc();
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('덧셈:'),
                      Switch(
                        value: addSwitch,
                        onChanged: (value) {
                          setState(() {
                            addSwitch = value;
                            // addFunc();
                          });
                        },
                      ),
                      const Text('뺄셈:'),
                      Switch(
                        value: subSwitch,
                        onChanged: (value) {
                          setState(() {
                            subSwitch = value;
                            // subFunc();
                            print(2 * 10 - 10 / 2 * 90);
                          });
                        },
                      ),
                      const Text('곱셈:'),
                      Switch(
                        value: mulSwitch,
                        onChanged: (value) {
                          setState(() {
                            mulSwitch = value;
                            // mulFunc();
                          });
                        },
                      ),
                      const Text('나눗셈:'),
                      Switch(
                        value: divSwitch,
                        onChanged: (value) {
                          setState(() {
                            divSwitch = value;
                            // divFunc();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: addition,
                  decoration: const InputDecoration(
                    labelText: '덧셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: subtraction,
                  decoration: const InputDecoration(
                    labelText: '뺄셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: multiplication,
                  decoration: const InputDecoration(
                    labelText: '곱셈 결과',
                  ),
                  readOnly: true,
                ),
                TextField(
                  controller: division,
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
    addition.text = '${int.parse(num1.text) + int.parse(num2.text)}';
    subtraction.text = '${int.parse(num1.text) - int.parse(num2.text)}';
    multiplication.text = '${int.parse(num1.text) * int.parse(num2.text)}';
    division.text =
        (double.parse(num1.text) / double.parse(num2.text)).toStringAsFixed(2);
    addSwitch = true;
    subSwitch = true;
    mulSwitch = true;
    divSwitch = true;
  }

  deleteText() {
    num1.text = '';
    num2.text = '';
    addition.text = '';
    subtraction.text = '';
    multiplication.text = '';
    division.text = '';
    setState(() {
      addSwitch = false;
      subSwitch = false;
      mulSwitch = false;
      divSwitch = false;
    });
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

  addFunc() {
    if (addSwitch == true) {
      addition.text = '${int.parse(num1.text) + int.parse(num2.text)}';
    } else {
      addition.text = '';
    }
  }

  subFunc() {
    if (subSwitch == true) {
      subtraction.text = '${int.parse(num1.text) - int.parse(num2.text)}';
    } else {
      subtraction.text = '';
    }
  }

  mulFunc() {
    if (mulSwitch == true) {
      multiplication.text = '${int.parse(num1.text) * int.parse(num2.text)}';
    } else {
      multiplication.text = '';
    }
  }

  divFunc() {
    if (divSwitch == true) {
      division.text = (double.parse(num1.text) / double.parse(num2.text))
          .toStringAsFixed(2);
    } else {
      division.text = '';
    }
  }
} // End
