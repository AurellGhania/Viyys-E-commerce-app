import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-manegement/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});
  //bentuk dari inisialisasi variable
  final Product product;

  //kalo deklarasi variable langsung ada value nya
  @override
  Widget build(BuildContext context) {
    //disini unutk menginisialisasi provider
    //disini untuk pengenaln provider
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    final isFavorite = wishlistProvider.wishlistitems.containsKey(
      product.id.toString()
    );

    return IconButton(
      onPressed: () {
        //disini kita checking, is our product favorite or no?

        //disini
        if (isFavorite) {
          //menghapus item dari wishlist via tombol fav kalo di klik 2 kali
          //untuk menghapus item wishlist
          //triger ini nya itu love, aku
          //kalo kita ngeklik love kita melakukan triger memasukan ke wishlist, jika klik trigger lagi maka akan diremove 
          wishlistProvider.removeItemfromFav(product.id.toString());
          //kalo ada wishlist nya tambahin ini, (kondisi if else ini)
        } else {
          //dia maunya string, string, int, string
          //disini kita ambil acuannya daro models, jadi tipe data ini sesuai model kita
          //ini itu yg penting dia itu match sama tipe dadta yg dikasih, bukan sesuai urutan
          wishlistProvider.addItemToFav(
          //product ini kita ikutin tipe data madel, yaitu int, makanya disini kia ganti ke string
          //disini urutan berpengaruhbuntuk memechingkan tipe data
          //convert to string karna ada perubahan tipe data di models nya
          product.id.toString(),
          product.title,
          product.price,
          product.image,
          product.color
          );
        }
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite? Colors.red : Colors.grey.shade500
      )
    );
  }
}