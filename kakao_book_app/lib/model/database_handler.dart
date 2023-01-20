import 'package:kakao_book_app/model/cart.dart';
import 'package:kakao_book_app/model/message.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  // Dao랑 비슷하다고 보면 된다.
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'semipj.db'),
      onCreate: (database, version) async {
        await database.execute(
          // 'create table students(id integer primary key autoincrement, code text, name text, dept text, phone text)',
          'create table cart(cartId integer primary key autoincrement, userId text, authors text, title text, price text, thumbnail text)',
        );
      },
      version: 1,
    );
  }

// ------
  Future<int> insertCart(Cart cart) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into cart(authors, title, price, thumbnail, userId) values(?, ?, ?, ?, ?)',
        [
          cart.authors,
          cart.title,
          cart.price,
          cart.thumbnail,
          Message.customerId
        ]);

    return result;
  }

  // Future<int> updateStudents(Students student) async {
  //   int result = 0;
  //   final Database db = await initializeDB();
  //   result = await db.rawUpdate(
  //       'update students set name = ?, dept = ?, phone = ? where id = ?',
  //       [student.name, student.dept, student.phone, student.id]);

  //   return result;
  // }

  Future<int> deleteCart(int id) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawDelete(
      'delete from cart where cartId = ?',
      [id],
    );

    return result;
  }

  // Future<int> deleteStudent(Students students) async {
  //   int result = 0;
  //   final Database db = await initializeDB();
  //   result = await db.rawDelete(
  //     'delete from students where id = ?',
  //     [students.id],
  //   );

  //   return result;
  // }

  Future<List<Cart>> queryCart() async {
    // DB 설정하기
    final Database db = await initializeDB();
    // KEY를 가지고와서 사용해야함.
    final List<Map<String, Object?>> queryResult = await db
        .rawQuery('select * from cart where userId = ?', [Message.customerId]);
    return queryResult.map((e) => Cart.formMap(e)).toList();
  }
} // END
