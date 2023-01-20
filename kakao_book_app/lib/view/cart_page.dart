import 'package:flutter/material.dart';
import 'package:kakao_book_app/model/cart.dart';
import 'package:kakao_book_app/model/database_handler.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
        title: const Text('장바구니'),
        backgroundColor: Colors.black38,
      ),
      body: FutureBuilder(
        future: handler.queryCart(),
        builder: (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(snapshot.data![index]),
                  onDismissed: (DismissDirection direction) async {
                    await handler.deleteCart(snapshot.data![index].cartId!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        color: const Color.fromARGB(53, 255, 255, 255),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.network(
                                      snapshot.data![index].thumbnail,
                                      height: 120,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data![index].authors
                                                    .length <=
                                                23
                                            ? snapshot.data![index].authors
                                            : '${snapshot.data![index].authors.substring(0, 23)}...'),
                                        Text(snapshot.data![index].title
                                                    .length <=
                                                18
                                            ? snapshot.data![index].title
                                            : '${snapshot.data![index].title.substring(0, 18)}...'),
                                        Text(
                                          '${snapshot.data![index].price}원',
                                          // '가격: ${data![index]['price'].toString()}원',
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
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
} // End
