import 'package:flutter/material.dart';
import 'package:semiproject_app/model/database_handler.dart';
import 'package:semiproject_app/model/message.dart';
import 'package:semiproject_app/model/register.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  late DatabaseHandler handler;
  late int position;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      // await addStudents();
      setState(() {
        //
      });
    });
    position = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Message.recipeName} 레시피'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/registerPage2')
                  .then((value) => rebuildData());
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryRegister(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Register>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data![position].registerContent),
                Text(snapshot.data![position].registerSecond),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (snapshot.data!.length <= position) {
                        print('끝');
                        _showDialog(context);
                      } else {
                        position++;
                      }
                    });
                  },
                  child: const Text(
                    '다음',
                  ),
                ),
              ],
            );
            //   },
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

// --- Functions
  rebuildData() {
    setState(() {
      handler.queryRegister();
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('끝'),
          content: const Text('끝'),
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
