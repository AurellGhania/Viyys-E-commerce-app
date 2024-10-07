//item itu untuk mendefinidiksn bagaiman asebuah objek akan terjadi
//menjadikan semua object reusable

import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/consts.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({super.key, required this.product, required this.press});//press kita bikin sendiri terserah mau namanya apa, bia diubah ke onpres

  final Product product;//ini itu sub class dari anak anak yg punya banyak data
  final VoidCallback press; //mengasih sebuah feed back ke user



  //mvvm adalah model view-view model
  //model itu detail data
  //item itu untuk mendefinidiksn bagaiman sebuah objek akan terjadi
  //menjadikan semua object reusable
  //ui sama view sama
  
   @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: press, // Kalau di-tap, fungsi press dijalaninbiar kyk mendorong gitu, kayak di shopee
      
      child: Column( // Nampilin elemen-elemen secara vertikal
        

        children: [
          Expanded( // Buat ngatur biar isinya proporsional, ngisi ruang kosong
            child: Container( // Kotak untuk gambar produk
              padding: const EdgeInsets.all(dafultPadding), // Jarak dari sisi ke isi (padding)
              decoration: BoxDecoration( // Styling si kotak, kayak warna dan rounded corner
                color: product.color, // Warna produk
                borderRadius: BorderRadius.circular(16) // Bikin sudutnya melengkung
                ),
                child: Hero( // Efek transisi keren ke detail page
                  tag: "${product.id}", // Unik tiap produk, makanya dia pake id, kusus buat ambil id
                  child: Image.asset(product.image), // Gambar produk
                ),
                        
              ),
          ),
          
          Row( 
          children: [
            Expanded( // Biar teksnya ngambil lebar penuh
              child: Padding( // Biar teks nggak nempel ke tepi
                padding: const EdgeInsets.symmetric(horizontal: dafultPadding), // Jarak kiri-kanan
                child: Column( // Teksnya ditaruh vertikal (judul di atas, harga di bawah)
                  crossAxisAlignment: CrossAxisAlignment.start, // Semua teks rata kiri
                  children: [
                    Text(
                      product.title, // Judul produk
                      style: const TextStyle(color: textColor), // Styling teks
                      textAlign: TextAlign.left, // Judul rata kiri
                    ),
                    Text(
                      "Rp ${product.price}", // Harga produk
                      style: const TextStyle(color: textColor), // Styling teks harga
                      textAlign: TextAlign.left, // Harga rata kiri juga
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
        ],
      ),
    );
  }
}
