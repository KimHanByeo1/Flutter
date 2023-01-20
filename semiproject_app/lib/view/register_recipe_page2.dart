import 'package:flutter/material.dart';
import 'package:semiproject_app/model/database_handler.dart';
import 'package:semiproject_app/model/message.dart';
import 'package:semiproject_app/model/register.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  late TextEditingController recipeText;
  late TextEditingController minuteTime;
  late TextEditingController hourTime;
  late int totalTime;
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    recipeText = TextEditingController();
    hourTime = TextEditingController();
    minuteTime = TextEditingController();
    totalTime = 0;
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Message.recipeName} 레시피 등록'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: recipeText,
                decoration: const InputDecoration(
                  hintText: '레시피를 입력하세요.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: hourTime,
                      decoration: const InputDecoration(
                        hintText: '시간',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const Text(
                    '시간',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: minuteTime,
                      decoration: const InputDecoration(
                        hintText: '분',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const Text(
                    '분',
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addRegister();
                _showDialog(context);
              },
              child: const Text(
                '등록',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions
  Future<int> addRegister() async {
    Register addRecipe = Register(
      registerContent: recipeText.text.trim(),
      registerSecond:
          (int.parse(hourTime.text) * 3600 + int.parse(minuteTime.text) * 60)
              .toString(),
    );
    await handler.insertRecipe2(addRecipe);
    return 0;
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('레시피 등록'),
          content: const Text('레시피 등록을 완료하였습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
} // End
