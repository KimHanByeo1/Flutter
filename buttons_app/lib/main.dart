import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print('text Buttons');
              },
              onLongPress: () {
                print('long text button');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('Elevated Buttons');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Elevated Button',
              ),
            ),
            OutlinedButton(
              onPressed: () => print('outlined button'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: const Text(
                'outlined Button',
              ),
            ),
            TextButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
              ),
              label: const Text('Go to home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(130, 40),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
              ),
              label: const Text('Go to home'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      //
                    },
                    child: const Text('TextButton'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //
                  },
                  child: const Text('ElevatedButton'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
