import 'package:flutter/material.dart';
import 'package:semiproject_app/model/database_handler.dart';
import 'package:semiproject_app/model/message.dart';
import 'package:semiproject_app/model/recipe.dart';
import 'package:semiproject_app/view/recipeDetail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('레시피 리스트'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/registerPage')
                  .then((value) => rebuildData());
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryRecipe(),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(snapshot.data![index]),
                  // onDismissed: (DismissDirection direction) async {
                  //   await handler.deleteStudents(snapshot.data![index].id!);
                  //   // deleteStudents(snapshot, index);
                  //   setState(() {
                  //     snapshot.data!.remove(snapshot.data![index]);
                  //   });
                  // },
                  child: GestureDetector(
                    onTap: () {
                      Message.recipeId =
                          snapshot.data![index].recipeId.toString();
                      Message.recipeName = snapshot.data![index].recipeName;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecipeDetail(),
                          ));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Code   :   ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(snapshot.data![index].recipeId.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                '이름   :   ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(snapshot.data![index].recipeName),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                '내용  :   ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(snapshot.data![index].recipeContent),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
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
      handler.queryRecipe();
    });
  }
} // End
