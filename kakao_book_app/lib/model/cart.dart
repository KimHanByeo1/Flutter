// Model Dart
import 'package:flutter/material.dart';

class Cart {
  final int? cartId; //  ? = nullsafty autoincrement라서 ㅇㅇ 값안주고 자동생성이니까 ㅇㅇ
  final String thumbnail;
  final String price;
  final String title;
  final String authors;

  // Constructor
  Cart(
      {this.cartId,
      required this.thumbnail,
      required this.price,
      required this.title,
      required this.authors});

// dart에서는 중복이름이 안되기 때문에 생성자를 만들어서 쓴다.
  Cart.formMap(Map<String, dynamic> res)
      : cartId = res['cartId'],
        thumbnail = res['thumbnail'],
        price = res['price'],
        title = res['title'],
        authors = res['authors'];

  Map<String, Object?> toMap() {
    return {
      'cartId': cartId,
      'thumbnail': thumbnail,
      'price': price,
      'title': title,
      'authors': authors
    };
  }
}
