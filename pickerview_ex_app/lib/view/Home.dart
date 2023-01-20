import 'package:flutter/material.dart';
import 'package:pickerview_ex_app/model/message.dart';

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
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addView');
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Message.list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //
            },
            child: SizedBox(
              height: 100,
              child: Card(
                color: index % 2 == 0 ? Colors.amber : Colors.blueGrey,
                child: Row(
                  children: [
                    Image.asset(
                      Message.list[index].imagePath,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      Message.list[index].textValue,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
