import 'package:path/path.dart';
import 'package:semiproject_app/model/message.dart';
import 'package:semiproject_app/model/recipe.dart';
import 'package:semiproject_app/model/register.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  // Dao랑 비슷하다고 보면 된다.
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'flutterSPJ.db'),
      onCreate: (database, version) async {
        await database.execute(
          '''
          create table recipe(
            recipeId integer primary key autoincrement,
            recipeName text,
            recipeContent text)
          ''',
        );
        await database.execute(
          '''
          create table register(
            registerId integer primary key autoincrement,
            recipeId integer,
            registerContent text,
            registerSecond text)
            ''',
        );
      },
      version: 1,
    );
  }

// ------

  Future<int> insertRecipe(Recipe recipe) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into recipe(recipeName, recipeContent) values(?, ?)',
        [recipe.recipeName, recipe.recipeContent]);

    return result;
  }

  Future<int> insertRecipe2(Register register) async {
    int result = 0;
    print(Message.recipeId);
    print(register.registerContent);
    print(register.registerSecond);
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into register(recipeId, registerContent, registerSecond) values(?, ?, ?)',
        [Message.recipeId, register.registerContent, register.registerSecond]);

    return result;
  }

  Future<List<Recipe>> queryRecipe() async {
    // DB 설정하기
    final Database db = await initializeDB();
    // KEY를 가지고와서 사용해야함.
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from recipe');
    return queryResult.map((e) => Recipe.formMap(e)).toList();
  }

  Future<List<Register>> queryRegister() async {
    // DB 설정하기
    final Database db = await initializeDB();
    // KEY를 가지고와서 사용해야함.
    final List<Map<String, Object?>> queryResult = await db.rawQuery(
        'select * from register where recipeId = ${Message.recipeId}');
    return queryResult.map((e) => Register.formMap(e)).toList();
  }
} // END
