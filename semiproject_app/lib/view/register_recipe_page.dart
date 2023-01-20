import 'package:flutter/material.dart';
import 'package:semiproject_app/model/database_handler.dart';
import 'package:semiproject_app/model/recipe.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController foodName;
  late TextEditingController foodContent;
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    foodName = TextEditingController();
    foodContent = TextEditingController();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('레시피 등록'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: foodName,
                    decoration: const InputDecoration(
                      hintText: '음식 이름',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: foodContent,
                    decoration: const InputDecoration(
                      hintText: '음식 설명',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    addRecipe();
                    _showDialog(context);
                  },
                  child: const Text(
                    '입력',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Functions
  Future<int> addRecipe() async {
    Recipe addRecipe = Recipe(
      recipeName: foodName.text.trim(),
      recipeContent: foodContent.text.trim(),
    );
    await handler.insertRecipe(addRecipe);
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
