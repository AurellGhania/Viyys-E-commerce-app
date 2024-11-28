import 'package:flutter/material.dart';

class CartItem {

  final String id;
  final String title;
  final int price;
  final String image;
  int quantity; //ini itu ga final karna dia itu ga wajib, terus kita tambahin minimal 1

//command titik, pilih yg kedua
  CartItem({
    required this.id, 
    required this.title, 
    required this.price,
    required this.image, 
    //default quantity is 1
    this.quantity = 1
    });
}

//extends itu buat pewarisan, kalo with digunakan untuk menambahkan fitur ke sebuah class
//ini itu bukan oop
//with itu sub class dari mixin
//mixin itu pendefinisian sebuah class yg lawas
//mixin itu salah satu cara yg bisa nge reused  di multiple class hieararchie

// to knowing whats the diffrences between OOP and FP(functional programming)
 
class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  Map<String, int> _quantities = {};

  int getQuantity(String productId) => _quantities [productId] ?? 1;

  int get itemCount => _items.length;

  //buat menghandel total amount of prize (lgi buat getter nya)
  //untuk menghandle perhitungan total harga yg ada di keranjang
  int get totalPrice {
    return _items.values.fold(
      0,
      //sum itu untuk menambahkan item.price
      (sum, item) => sum + item.price * item.quantity //ini itu dikali
    );
  }

  void updateQuantity(String productId, int quantity){
    //ini setter
    //ini buat ngeupdate jumlahnya berdasarkan productid
    _quantities[productId] = quantity;
    notifyListeners();

  }


  void addItem(String id, String title, int price, String image, int quantity) {
    //kalo product sudah ada di dalam keranjang
    if (_items.containsKey(id)) {
      _items[id]!.quantity += quantity;

    } else {
        _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity : quantity);
    }
    notifyListeners();
  }

  void removeItems(String id) {
    //kalo pake ini semuanya langsung ke apus
    _items.remove(id);
    notifyListeners();

    //kalo yg ini sekali klik cuman mengurangi 1
    // if (_items.containsKey(id)) {
    //   //kurangi kuantitas item nya
    //   _items[id]!.quantity--;

    //   //jika quantitas menjadi 0, maka hapus item dari keranjang
    //  if (items[id]!.quantity <= 0) {
    //    _items.remove(id);
    //  }
    // //kalo di quntity itu untuk null save ty
    // //kalo taro di depan buat note, sama kaayak di login screen
    // }
    
    // notifyListeners();
  }

}