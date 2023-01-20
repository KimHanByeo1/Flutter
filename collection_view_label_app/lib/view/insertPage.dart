import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection_view_label_app/model/heroListC.dart';
import 'package:flutter/material.dart';

import '../model/heroList.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late TextEditingController textEditingController;
  late List _imageName;
  late int selectedItem;
  late CarouselController buttonCarouselController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    _imageName = [
      'images/pikachu1.png',
      'images/pikachu2.png',
      'images/pikachu3.png',
    ];
    selectedItem = 0;
    buttonCarouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('인물 추가'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '인물을 추가 하세요',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider.builder(
                carouselController: buttonCarouselController,
                itemCount: _imageName.length,
                itemBuilder: (context, position, realIndex) {
                  return Image.asset(_imageName[position]);
                },
                options: CarouselOptions(
                  // autoPlay: true,
                  // autoPlayInterval: const Duration(milliseconds: 100),
                  // autoPlayAnimationDuration: const Duration(milliseconds: 1),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (position, reason) {
                    setState(() {
                      selectedItem = position;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(_imageName[selectedItem]),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  addList();
                  Navigator.of(context).pop();
                },
                child: const Text('추가'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Function ---
  addList() {
    Message.heroName = textEditingController.text;
    Message.heroImage = _imageName[selectedItem];
    Message.heroList.add(
        HeroList(heroName: Message.heroName, heroImage: Message.heroImage));
  }
} // End
