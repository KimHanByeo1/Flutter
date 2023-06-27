import 'package:get/get.dart';

class Product {
  Product({
    required this.name,
    required this.price,
    required this.imageLink,
    this.rating,
  });

  String name;
  String price;
  String imageLink;
  double? rating;

  var like = false.obs;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        price: json["price"],
        imageLink: json["image_link"],
        rating: json["rating"]?.toDouble(),
      );
}
