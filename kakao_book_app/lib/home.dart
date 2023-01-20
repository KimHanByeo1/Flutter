import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_book_app/model/cart.dart';
import 'package:kakao_book_app/model/database_handler.dart';
import 'package:kakao_book_app/model/message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler; // 클래스 연결
  late List data; // 출력할 도서 리스트 담아둘 변수 선언
  late TextEditingController textEditingController;
  late String search;
  late ScrollController scrollController;
  late int page;
  late List userInfo;
  late String userName;
  late String userEmail;

  late String userId;
  late String authors;
  late String title;
  late String price;
  late String thumbnail;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler(); // 클래스 연결
    textEditingController = TextEditingController();
    scrollController = ScrollController();

    search = '알고리즘';
    page = 1;
    userName = '';
    userEmail = '';

    scrollController.addListener(() {
      // ***
      // 리스트의 마지막일 경우
      print("Listener");
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        print('bottom');
        page++;
        getJSONData();
      }
    });
    data = []; // 출력할 도서 리스트 담아둘 변수 배열로 셋팅
    userInfo = [];
    getJSONData();
    if (Message.loginCheck == 1) {
      getUserInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              labelText: '검색',
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              setState(() {
                data.clear();
                search = textEditingController.text;
                getJSONData();
              });
            },
          ),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('images/pikachu1.png'),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu2.png'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu3.png'),
                ),
              ],
              accountName: Text(Message.loginCheck == 1 ? userName : ''),
              accountEmail: Text(Message.loginCheck == 1 ? userEmail : ''),
              decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              title: const Text('Cart'),
              onTap: () {
                Message.loginCheck == 0
                    ? _loginCheck(context)
                    : Navigator.pushNamed(context, '/cartPage');
              },
            ),
            ListTile(
              leading: Icon(
                Message.loginCheck == 0 ? Icons.login : Icons.logout,
                color: Colors.black,
              ),
              title: Text(Message.loginCheck == 0 ? 'Log In' : 'Log Out'),
              onTap: () {
                setState(() {
                  Message.loginCheck == 0
                      ? Navigator.pushNamed(context, '/loginPage')
                      : Message.loginCheck = 0;
                });
              },
            ),
          ],
        )),
        body: Center(
            child: data.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
                    controller: scrollController,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return cardBuild(context, index);
                    },
                  )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (Message.loginCheck == 0) {
              _loginCheck(context);
            } else {
              Navigator.pushNamed(context, '/cartPage');
            }
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }

  cardBuild(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: () {
          if (Message.loginCheck == 0) {
            _loginCheck(context);
          } else {
            authors = data[index]['authors'].toString();
            title = data[index]['title'].toString();
            price = data[index]['price'].toString();
            thumbnail = data[index]['thumbnail'].toString();
            userId = Message.customerId;
            _showDialog(context, index);
          }
        },
        child: Card(
          color: const Color.fromARGB(53, 255, 255, 255),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.network(
                    data[index]['thumbnail'],
                    height: 90,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '저자: ${data[index]['authors'].toString()}'.length <= 19
                            ? '저자: ${data[index]['authors'].toString()}'
                            : '저자: ${'${data[index]['authors']}'.toString().substring(0, 16)}...',
                      ),
                      Text(
                        '제목: ${data[index]['title']}'.length <= 21
                            ? '제목: ${data[index]['title']}'
                            : '제목: ${'${data[index]['title']}'.substring(0, 18)}...',
                      ),
                      Text(
                        '가격: ${data[index]['price'].toString()}원',
                      ),
                      Text(
                        '판매여부: ${data[index]['status'].toString()}',
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&query=$search&page=$page');
    var response = await http.get(url,
        headers: {"Authorization": "KakaoAK 532fdee318de473888f10b20e05a3c29"});
    print(response.body);
    var dateConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dateConvertedJSON['documents'];
    setState(() {
      data.addAll(result);
    });
    return 'success';
  }

  cartInsert(BuildContext context, int index) async {
    // print(authors);
    // print(title);
    // print(price);
    // print(userId);
    // print(thumbnail);
    var url = Uri.parse(
        'http://localhost:8080/Flutter/insert_cart.jsp?authors=$authors&title=$title&price=$price&thumbnail=$thumbnail&userId=$userId');
    await http.get(url);
  }

  _showDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('장바구니'),
          content: const Text('장바구니에 담으시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                cartInsert(context, index);
                addCart(index);
                Navigator.of(context).pop();
              },
              child: const Text('예'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('아니오.'),
            ),
          ],
        );
      },
    );
  }

  // sqlite에 저장
  Future<int> addCart(int index) async {
    Cart firstStudent = Cart(
      authors: data[index]['authors'].toString(),
      price: data[index]['price'].toString(),
      thumbnail: data[index]['thumbnail'].toString(),
      title: data[index]['title'].toString(),
    );
    await handler.insertCart(firstStudent);

    return 0;
  }

  _loginCheck(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('error'),
          content: const Text('로그인 후 이용 가능합니다. \n로그인 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/loginPage');
              },
              child: const Text('예'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('아니오.'),
            ),
          ],
        );
      },
    );
  }

  Future<String> getUserInfo() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/userInfo_flutter.jsp?userId=${Message.customerId}');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      userInfo.addAll(result);
      userName = userInfo[0]['userName'];
      userEmail = userInfo[0]['userEmail'];
    });
    return 'success';
  }
}// End
