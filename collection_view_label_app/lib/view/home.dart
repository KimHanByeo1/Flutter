import 'package:flutter/material.dart';

import '../model/heroList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지 인물'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/insert')
                    .then((value) => rebuild());
              },
              icon: const Icon(Icons.add_outlined))
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: Message.heroList.length,
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.grey,
              child: GestureDetector(
                onTap: () {
                  detailView(context, position);
                  Navigator.pushNamed(context, '/detail');
                },
                child: Card(
                  color: Colors.yellowAccent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Message.heroList[position].heroImage,
                          width: 70,
                        ),
                        Text(
                          Message.heroList[position].heroName,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- Function ---
  detailView(BuildContext context, int position) {
    Message.heroName = Message.heroList[position].heroName;
  }

  rebuild() {
    setState(() {
      // ---
    });
  }
} // End
