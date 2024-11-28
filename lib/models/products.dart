import 'package:flutter/material.dart';

class Product {

//mvvm arkitecture, model view view model
//mvvm itu memisahkan antara model dan juga ui nya

  //ini itu untuk modelnya
  //model itu apa??
  //model itu detail data
  
//ini adalah satu satunya acuan data yg digunakan
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  }
    // this adalah, untuk manandakan bahwa object terkait hanya bisa di akses oleh class terkait
    //atau class yg sebelumnya memanggil product
    
);
}

List<Product> product = [
  Product(
  id: 1, 
  image: "assets/images/product_1.png", 
  title:  "Banana", 
  price: 234, 
  description: descriptionText, 
  size: 12, 
  color: const Color.fromARGB(255, 255, 253, 209),
  ),
  Product(
  id: 2, 
  image: "assets/images/product_2.png", 
  title: "Seledri",
  price: 289, 
  description: descriptionText, 
  size: 12, 
  color: const Color.fromARGB(255, 211, 255, 215),
  ),
  Product(
  id: 3, 
  image: "assets/images/product_3.png", 
  title: "Tomato", 
  price: 145, 
  description: descriptionText, 
  size: 12, 
  color: const Color.fromARGB(255, 255, 198, 198),
  ),
  Product(
  id: 4, 
  image: "assets/images/product_4.png", 
  title: "Terong", 
  price: 98, 
  description: descriptionText, 
  size: 12, 
  color: const Color.fromARGB(255, 221, 212, 255),
  ),
  Product(
  id: 5, 
  image: "assets/images/product_5.png", 
  title: "kol", 
  price: 267, 
  description: descriptionText, 
  size: 12, 
  color: const Color.fromARGB(255, 219, 255, 219),
  ),
  Product(
  id: 6, 
  image: "assets/images/product_6.png", 
  title: "Potato", 
  price: 194, 
  description: descriptionText, 
  size: 12, 
  color: const Color.fromARGB(255, 255, 246, 207),
  )
];

String descriptionText = "Lorem ipsum dolar sit amet";