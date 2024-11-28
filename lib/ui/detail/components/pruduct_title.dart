import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    //definisikan ukuran proposional gambar sebagai variable const
    const double imageWidthRatio = 0.68; //78% dari lebar layar
    const double imageHeightRatio = 0.32; //35% dari tinggi layar

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: dafultPadding / 20), // Mengurangi padding vertikal lebih jauh
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the start
        children: [
          const Text(
            "Fruits and Vegetable", // Static title
            style: TextStyle(color: Color.fromARGB(255, 23, 2, 2)),
          ),
          Text(
            product.title, // Dynamic product title
            style: const TextStyle(
              color: Color.fromARGB(255, 21, 1, 1),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: dafultPadding / 15), // Mengurangi jarak antara judul dan harga
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price", // Static price label
                      style: TextStyle(color: Color.fromARGB(255, 16, 1, 1)),
                    ),
                    Text(
                      "${product.price}", // Dynamic product price
                      style: const TextStyle(
                        color: Color.fromARGB(255, 19, 1, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight, // Menggeser gambar ke kanan dan ke atas
                child: Hero(
                  tag: "${product.id}",
                  child: SizedBox( // Wrap the Image.asset in a Container
                    width: size.width * imageWidthRatio, // Gunakan ratio untuk lebar gambar
                    height: size.height * imageHeightRatio, // Gunakan ratio untuk tinggi gambar
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.fill, // Ensure proper scaling
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
