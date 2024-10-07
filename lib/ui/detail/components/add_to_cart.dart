import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: dafultPadding),
      child: Row( // panggil child kalo mau ngeluarin widget
        children: <Widget>[ // pake children kalo mau manggil list di antara widget-widgetnya
          Container(
            margin: const EdgeInsets.only(right: dafultPadding),
            height: 50,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color
              ),
            ),
            child: IconButton(
              onPressed: () {}, // kalo mau ngeluarin fungsi
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ),
          Expanded(//biar mengisi kekosongan
            child: ElevatedButton(//kalo mau ngemodified button pake style form
            style: ElevatedButton.styleFrom(
              backgroundColor: product.color,
              maximumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)
              )

            ),
              onPressed: () {},
              child: const Text(//childnya itu widget yg ada di dalam
                "Buy Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 34, 3, 3)
                ),
              )
              ),
          )
        ],
      ),
    );
  }
}
