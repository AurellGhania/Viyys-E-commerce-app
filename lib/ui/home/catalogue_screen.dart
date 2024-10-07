import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/items_card.dart';
import 'package:flutter/material.dart';

// CatalogueScreen menerima parameter name dan location dari Login
class CatalogueScreen extends StatelessWidget {
  final String name; // Nama dari Login
  final String location; // Lokasi dari Login

  const CatalogueScreen({super.key, required this.name, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menyembunyikan tombol kembali otomatis
        backgroundColor: Colors.white, // Mengatur warna background AppBar
        elevation: 0, // Menghilangkan bayangan pada AppBar
        actions: [
          IconButton(
            onPressed: () {}, // Aksi ketika ikon pencarian ditekan (saat ini tidak ada fungsi)
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {}, // Aksi ketika ikon keranjang belanja ditekan (saat ini tidak ada fungsi)
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Menyelaraskan teks ke kiri
        children: [
          // Menampilkan nama dan lokasi yang dikirim dari Login
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dafultPadding),
            child: Text(
              "Welcome $name!", // Menampilkan nama dan lokasi di layar
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30, // Ukuran font
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dafultPadding),
            child: Text(
              " $location", // Menampilkan nama dan lokasi di layar
              style: const TextStyle(
                fontSize: 20, // Ukuran font
              ),
            ),
          ),
          const Categories(), // Menampilkan kategori produk
          Expanded( // Mengisi ruang kosong di bawah kategori
            child: SingleChildScrollView( // Membuat halaman bisa di-scroll
              child: Column(
                children: [
                  const SizedBox(height: 5), // Jarak antara elemen
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: dafultPadding),
                    child: Image.asset(
                      'assets/images/banner_1.png', // Menampilkan gambar banner
                      fit: BoxFit.cover, // Membuat gambar menutupi seluruh area
                    ),
                  ),
                  const SizedBox(height: 20), // Menambahkan jarak antara banner dan grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: dafultPadding),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(), // Menonaktifkan scroll pada grid
                      shrinkWrap: true, // Agar grid hanya mengambil ruang yang diperlukan
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 item per baris
                        mainAxisSpacing: dafultPadding, // Jarak vertikal antar item
                        crossAxisSpacing: dafultPadding, // Jarak horizontal antar item
                        childAspectRatio: 0.75, // Perbandingan lebar dan tinggi item
                      ),
                      itemCount: product.length, // Jumlah item sesuai dengan produk yang tersedia
                      itemBuilder: (context, index) => ItemsCard(
                        product: product[index], // Menampilkan produk berdasarkan index
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(product: product[index]), // Pindah ke DetailScreen dengan produk terpilih
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
