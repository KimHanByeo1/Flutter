import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController sepalLengthController;
  late TextEditingController sepalWidthController;
  late TextEditingController petalLengthController;
  late TextEditingController petalWidthController;

  late String sepalLength;
  late String sepalWidth;
  late String petalLength;
  late String petalWidth;

  late String imageName;
  String result = 'all';

  @override
  void initState() {
    super.initState();
    sepalLengthController = TextEditingController();
    sepalWidthController = TextEditingController();
    petalLengthController = TextEditingController();
    petalWidthController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IRIS 품종예측'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: sepalLengthController,
                  decoration: const InputDecoration(
                    labelText: 'Sepal Length',
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                TextField(
                  controller: sepalWidthController,
                  decoration: const InputDecoration(
                    labelText: 'Sepal Width',
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                TextField(
                  controller: petalLengthController,
                  decoration: const InputDecoration(
                    labelText: 'Petal Length',
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                TextField(
                  controller: petalWidthController,
                  decoration: const InputDecoration(
                    labelText: 'Petal Width',
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    sepalLength = sepalLengthController.text;
                    sepalWidth = sepalWidthController.text;
                    petalLength = petalLengthController.text;
                    petalWidth = petalWidthController.text;
                    getJSONData();
                  },
                  child: const Text(
                    '입력',
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/$result.jpg'),
                  radius: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Functions
  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Rserve/response_iris.jsp?sepalLength=$sepalLength&sepalWidth=$sepalWidth&petalLength=$petalLength&petalWidth=$petalWidth');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
    _showDialog(context, result);
  }

  _showDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('품종 예측 결과'),
          content: Text('입력하신 품종을 $result 입니다.'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  imageName = result;
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }
} // End
