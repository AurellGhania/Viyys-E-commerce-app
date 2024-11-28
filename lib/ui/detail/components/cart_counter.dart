import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-manegement/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;

  //ini adalah sebuah callback untuk mengirim kuantity ke addto cart
  //final Function(int) onQuantityChange;

  const CartCounter({super.key, required this.product});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  //biar default nya satu
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    //inisialisai provider
    final cartProvider = Provider.of<CartProvider>(context);
    return Row(
      children: <Widget>[
        //logika untuk tombol pengurangan
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed:
            quantity > 1 
            ? () {
              //kalo pake state full, pasti pake setState
              //set state itu isinya buat inisialisasi awal
              setState(() {
                // akan mengurangi quantity secara lokal
                //maksudnya lokal adalah dia yg belum masuk ke keranjanh, jadi button ini itu istillah nya ga bekerja
                quantity--;
              });

              cartProvider.removeItems(widget.product.id.toString());

              //untuk mengirim quantity terbaru
              //widget.onQuantityChange(quantity);
            }
          //ini akan mendisable tombol jika kuantitas <=1
          : null,
          child: const Icon(Icons.remove),

         ),

         //const SizedBox(width: dafultPadding),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: dafultPadding),
          child: Text(
            //ini itu buat nanti kalo satuan 01, 02, 03
            //pokoknya dia buat ga error
            //dia ngabmbil 2 dijit nya aja
            //untk mempersinkat error an
            quantity.toString().padLeft(2, "0"),
            style: const TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          ),
         ),

         OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0)
            )

          ),
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              //untuk menambahkan quantitas secara lokal
              //kecuali user melakukan klik ke keranjang
              quantity++;
            });
              //untuk mengirim quantity terbaru
              //widget.onQuantityChange(quantity);

              //ini yg add item itu pendeklarasi informasi yg akan dikirimkan ke adtocart (tombol keranjang)
              //merupakan starting point dimana quantitas akan dibawa oleh tombol kerangjang ke halaman keranjangx
              //ini akan mengirimkan data ke halaman keranjang
              //tombol add to cart ini yg membawa  data
              //penyambungan datanya

              cartProvider.addItem(
                  widget.product.id.toString(),
                  widget.product.title,
                  widget.product.price,
                  widget.product.image,
                  1
              );
          }

          )
         
      ],
    );
  }
}