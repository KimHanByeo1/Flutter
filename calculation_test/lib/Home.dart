import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textValue;

  @override
  void initState() {
    super.initState();
    textValue = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('계산기'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textValue,
              readOnly: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    deleteFunc();
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('AC'),
                ),
                ElevatedButton(
                  onPressed: () {
                    //
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('+-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '%';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('%'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '/';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('÷'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '7';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '8';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '9';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '*';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('X'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '4';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '5';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '6';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '-';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '1';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '2';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '3';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '+';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('+'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '0';
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(194, 60)),
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () {
                    textValue.text += '.';
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('.'),
                ),
                ElevatedButton(
                  onPressed: () {
                    //
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(97, 60)),
                  child: const Text('='),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Function() ---
  deleteFunc() {
    setState(() {
      textValue.text = '';
    });
  }
} // End
