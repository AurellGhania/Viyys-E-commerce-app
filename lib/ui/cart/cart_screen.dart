import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-manegement/cart_provider.dart';
import 'package:e_commerce/state-manegement/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context);

    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Cart",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 1,
      // ),
      body: cartProvider.items.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartProvider.items.values.toList()[index];

                      return Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(10),
                        color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar produk (tanpa border, ukuran lebih besar)
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                cartItem.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Info produk
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Judul produk yang lebih besar
                                  const SizedBox(height: 20),
                                  Text(
                                    cartItem.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                     color: themeProvider.isDarkTheme ? Colors.white : Colors.black,

                                      fontSize: 18,  // Membesarkan ukuran font
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  // Harga produk yang lebih besar
                                  Text(
                                    "\$${cartItem.price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 16,  // Membesarkan ukuran font
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                            // Cart counter and buttons are on the right, now moved to the bottom
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Tombol decrement (kotak dengan radius)
                                      InkWell(
                                        onTap: () {
                                          if (cartItem.quantity > 1) {
                                            cartProvider.addItem(
                                              cartItem.id,
                                              cartItem.title,
                                              cartItem.price,
                                              cartItem.image,
                                              -1,
                                            );
                                          } else {
                                            cartProvider.removeItems(cartItem.id);
                                          }
                                        },
                                        child: Container(
                                          width: 30,  // increased width
                                          height: 30,  // increased height
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: const Text(
                                            "-",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,  // increased font size
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Counter quantity (kotak dengan radius)
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 23),
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2), // increased padding
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey.shade400),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          cartItem.quantity.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,  // increased font size
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      // Tombol increment (kotak dengan radius)
                                      InkWell(
                                        onTap: () {
                                          cartProvider.addItem(
                                            cartItem.id,
                                            cartItem.title,
                                            cartItem.price,
                                            cartItem.image,
                                            1,
                                          );
                                        },
                                        child: Container(
                                          width: 30,  // increased width
                                          height: 30,  // increased height
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: const Text(
                                            "+",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,  // increased font size
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Total dan Checkout
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration:  BoxDecoration(
                  color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Divider(
                        color: themeProvider.isDarkTheme ? Colors.white : Colors.grey,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           Text(
                            "Total Quantity",
                            style: TextStyle(fontSize: 17,
                                                    color: themeProvider.isDarkTheme ? Colors.white : Colors.black,

                            ),
                            
                          ),
                          const SizedBox(width: 170.0),
                          Text(
                            "${cartProvider.items.values.fold<int>(0, (sum, item) => sum + item.quantity)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                       Divider(
                        color: themeProvider.isDarkTheme ? Colors.white : Colors.grey,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           Text(
                            "Total Price",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                                 color: themeProvider.isDarkTheme ? Colors.white : Colors.black,

                            ),
                          ),
                          const SizedBox(width: 140.0),
                          Text(
                            "\$${cartProvider.totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      // Tombol Checkout
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          // Tambahkan logika checkout
                        },
                        child: const Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
