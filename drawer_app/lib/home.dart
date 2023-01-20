import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        actions: [
          IconButton(
            onPressed: () {
              print('Shopping cart is clicked');
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Search is clicked');
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/image01.png'),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage('images/image02.png'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/image03.png'),
              ),
            ],
            accountName: Text('Pikachu'),
            accountEmail: Text('pikachu@naver.com'),
            decoration: BoxDecoration(
              color: Colors.red,
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
            title: Text('Home'),
            onTap: () {
              print('Home is clicked.');
            },
            trailing: const Icon(
              Icons.add,
            ),
          )
        ],
      )),
    );
  }
}
