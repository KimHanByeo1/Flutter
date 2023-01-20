import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List _imageName;
  late int selectedItem;

  @override
  void initState() {
    super.initState();
    _imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker View로 이미지 선택'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Picker View로 이미지 선택',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 300,
                height: 250,
                child: CupertinoPicker(
                  backgroundColor: Colors.red[100],
                  itemExtent: 30,
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  },
                  children: [
                    Text(_imageName[0]),
                    Text(_imageName[1]),
                    Text(_imageName[2]),
                    Text(_imageName[3]),
                    Text(_imageName[4]),
                    Text(_imageName[5]),
                  ],
                ),
              ),
            ),
            Text(
              "Selected Item : ${_imageName[selectedItem]}",
            ),
            Image.asset(
              'images/${_imageName[selectedItem]}',
              width: 150,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
