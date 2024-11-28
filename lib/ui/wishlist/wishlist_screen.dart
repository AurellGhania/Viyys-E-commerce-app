import 'package:e_commerce/state-manegement/theme_provider.dart';
import 'package:e_commerce/state-manegement/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengakses provider wishlist
    final wishListProvider = Provider.of<WishlistProvider>(context);

    final themeProvider = Provider.of<ThemeProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"), // Judul wishlist
      ),
      // Kondisi ketika wishlist kosong atau ada isinya
      body: wishListProvider.wishlistitems.isEmpty
          ? const Center(child: Text("Your Wishlist is empty"))
          : GridView.builder(
              padding: const EdgeInsets.all(30), // Jarak dari tepi layar
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 item per baris
                mainAxisSpacing: 25, // Jarak vertikal antar item
                crossAxisSpacing: 30, // Jarak horizontal antar item
                childAspectRatio: 0.78, // Perbandingan lebar dan tinggi item
              ),
              itemCount: wishListProvider.wishlistitems.length,
              itemBuilder: (context, index) {
                // Mengambil item berdasarkan indeks
                final wishListItem =
                    wishListProvider.wishlistitems.values.toList()[index];

                return Container(
                  decoration: BoxDecoration(
                    color: wishListItem.color, // Warna latar container
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Efek bayangan
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Baris untuk harga dan ikon favorit
                      Row(
                        children: [
                          // Harga
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                             // Warna latar harga
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12), // Sudut kanan atas
                                bottomRight: Radius.circular(12), // Sudut kanan bawah
                                bottomLeft: Radius.circular(12), // Sudut kiri bawah
                                topLeft: Radius.circular(12), // Sudut kiri bawah
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8), // Padding container
                            child: Text(
                              "Rp${wishListItem.price}", // Harga dari wishListItem
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Spacer(), // Membuat ruang kosong di antara harga dan ikon love
                          IconButton(
                            icon: Icon(
                              wishListProvider.wishlistitems.containsKey(wishListItem.id)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: wishListProvider.wishlistitems.containsKey(wishListItem.id)
                                  ? Colors.red
                                  : Colors.grey.shade500,
                            ),
                            onPressed: () {
                              // Toggle favorite status
                              if (wishListProvider.wishlistitems.containsKey(wishListItem.id)) {
                                wishListProvider.removeItemfromFav(wishListItem.id);
                              } else {
                                wishListProvider.addItemToFav(
                                  wishListItem.id,
                                  wishListItem.title,
                                  wishListItem.price,
                                  wishListItem.image,
                                  wishListItem.color,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      // Gambar item
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 5,
                        ),
                        child: Image.asset(
                          wishListItem.image,
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                      // Judul item
                      Text(
                        wishListItem.title,
                        style: TextStyle(
                        color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],

                  ),
                  
                );
                
              },
            ),
    );
  }
}


          // Card(
          //   margin: const EdgeInsets.symmetric(
          //     vertical: 5,
          //     horizontal: 10
          //   ),
          //   //listtile buat menghasilkan list
          //   child: ListTile(  
          //     //leading itu buat kiri
          //     leading: CircleAvatar(
          //       backgroundImage: AssetImage(wishListItem.image),
          //     ),
          //     title: Text(wishListItem.title),
          //     //trailing buat sebelah kanan
          //     trailing: IconButton(
          //       icon: const Icon(Icons.delete),
          //       onPressed: () {
          //         wishListProvider.removeItemfromFav(wishListItem.id);
          //       }
          //       ),
          //   ),
            
          // );

      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.all(10),
      //   child: Row(
      //     //spacebetween buat jarak antar 1 widget, dengan space proposional
      //     //sama kayak spacer, cuman bedanya horizontal dan vertikal
      //     //disini kita pake row jadi pake spacebetween
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       const Text("Total",
      //       style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold
      //         ),
      //       ),
      //       Text(
      //         "${wishListProvider.totalPrice}",
      //         style: const TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //           color: primaryColor
      //         ),
      //       )
            
      //     ],
      //   ),

      // ),
