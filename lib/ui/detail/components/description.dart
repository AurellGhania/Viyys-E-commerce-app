import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  //ini itu sub class dari anak anak yg punya banyak data, yg ada di models
  final Product product;//ini itu tuh kita buat variabel, pertama yg Product p besar itu manggil class nya, terus product p kecil itu nama variable nya, makanya dibawah kita tinggal manggil product p kecil, dan masuknya lagi apa
  //ini utk perjelas lagi aja ya rel, walaupun di file sebelumnya kamu juga tetep ada catetannya

  @override
  Widget build(BuildContext context) {
    return Padding(
      //kalo constant itu sesuatu yg tidak berubah, itu tu tetap
      //sementara kalo di models itu datanya bukan statis, tapi dinamis
      //makanya kadang harus diapus const nya kalo kita manggil data di models, yang di product.dart
      padding: const EdgeInsets.symmetric(vertical: dafultPadding),
      child: Text(
        product.description,
        style: const TextStyle(
          height: 1.5
        ),
      ),
    
    );
  }
}