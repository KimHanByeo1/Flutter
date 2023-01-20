import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _buttonState;
  @override
  void initState() {
    super.initState();
    _buttonState = 'OFF';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    10,
                  ))),
              child: const Text(
                '버튼을 누르세요.',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('버튼 상태 :'),
                const SizedBox(
                  width: 10,
                ),
                Text(_buttonState)
              ],
            )
          ],
        ),
      ),
    );
  }

  // -- Function --
  _onClick() {
    print('onClick()이 호출됨');
    setState(() {
      // 빌드에 알려줘야 상태 변환이 됨.
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
      print(_buttonState);
    });
  }
} // End
