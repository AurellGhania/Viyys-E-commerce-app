import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-manegement/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product, required this.quantity});

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: dafultPadding),
      child: Row( // panggil child kalo mau ngeluarin widget
        //int finalQuantity = quantity,
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
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {

//cara pemanggilan nya adalah di add item, itu cara datanya terhubung antara satu sama lain
//jadi di additem nya itu di record sama notify listeners
                cartProvider.addItem(
                  product.id.toString(),
                  product.title,
                  product.price,
                  product.image,
                  quantity
                  //disini kita tinggal consume aja yg udah di olah sama cart counter
                  //disini kita tinggal manggil variable yg di cart counter
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Successfuly ${product.title} added to cart"),
                      duration: const Duration(seconds: 2),
                      )
                  );
              }, // kalo mau ngeluarin fungsi
              
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
              onPressed: ()  {
                
                cartProvider.addItem(
                  product.id.toString(),
                  product.title,
                  product.price,
                  product.image,
                  quantity
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Successfuly buy ${product.title}"),
                      duration: const Duration(seconds: 2),
                      )
                  );
              },
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
