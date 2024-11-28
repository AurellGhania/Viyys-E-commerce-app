import 'package:flutter/material.dart';

class WishlistItem {
  final String id;
  final String title;
  final int price;
  final String image;
  final Color color;

  WishlistItem(this.image, this.color, {required this.id, required this.title, required this.price});
}

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistItem> _wishListItems = {};

  Map<String, WishlistItem> get wishlistitems => _wishListItems;

  int get itemCount => wishlistitems.length;

  void addItemToFav(String id, String title, int price, String image, Color color){
    if (_wishListItems.containsKey(id)) {
      //jika sudah ada item yg ditambahkan ke keranjang
      return;

    } else {
      _wishListItems.putIfAbsent(
        id, 
        () => WishlistItem(image, color, id: id, title: title, price: price)
        
      );
    }
    notifyListeners();
  }   

  void removeItemfromFav(String id) {
    _wishListItems.remove(id);
    notifyListeners();
  }

//untuk membersihkan cache
  void clearWishlist() {
    _wishListItems.clear();
    notifyListeners();
  }
}