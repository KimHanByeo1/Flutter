import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/product_model.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                height: 75,
                width: 100,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(
                  product.imageLink,
                  fit: BoxFit.fill,
                ),
              ),
              Obx(
                () => CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: IconButton(
                    icon: product.like.value
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(Icons.favorite_border),
                    onPressed: () {
                      product.like.toggle();
                    },
                    iconSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.rating.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${product.price}',
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ]),
      ),
    );
  }
}
