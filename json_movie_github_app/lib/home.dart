import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // ******

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network JSON Test'),
      ),
      body: Center(
          child: data.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return cardBuild(context, index);
                  },
                )),
    );
  }

  cardBuild(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        color: index % 2 == 0 ? Colors.orangeAccent : Colors.amberAccent,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.network(
                  data[index]['image'],
                  height: 90,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  data[index]['title'],
                )
              ],
            )
          ],
        ),
      ),
      // child: ListView.builder(
      //   itemCount: data.length,
      //   itemBuilder: (context, index) {
      //     return ListView(

      //     )
      //   },),
    );
  }

  // --- Functions
  Future<bool> getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);
    var dateConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dateConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });
    return true;
  }
} // End
