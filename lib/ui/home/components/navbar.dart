

// import 'package:e_commerce/UI/detail/detail_screen.dart';
// import 'package:e_commerce/UI/home/components/categories.dart';
// import 'package:e_commerce/consts.dart';
// import 'package:e_commerce/models/products.dart';
// import 'package:e_commerce/settings/settings_screen.dart';
// import 'package:e_commerce/ui/cart/cart_screen.dart';
// import 'package:e_commerce/ui/home/catalogue_screen.dart';
// import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
// import 'package:e_commerce/ui/home/components/items_card.dart';
// import 'package:e_commerce/ui/profile/profile_screen.dart';
// import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
// import 'package:flutter/material.dart';




// class Navbar extends StatefulWidget {
//  const Navbar({super.key});


//  @override
//  State<Navbar> createState() => _NavbarState();
// }


// class _NavbarState extends State<Navbar> {
//    int _selectedIndex = 0;


//    //daftar tampilan untuk setiap tab
//    final List<Widget> _widgetOptions = [
    
    
//     //  CatalogueScreen(          
//     //    name: _usernameController.text, // Mengirim data nama
//     //    location: _locationController.text, // Mengirim data lokasi
//     //    ),


//      const WishlistScreen(),
//      //step pertama state manegement, disini kita third party nya pake provider
//      //pertama defisinikan library pada pubspec.yaml(jangan lupa de check library nya udaj ke update blm)
//      //kedua, tambahakan ChangeNotifier di file terkait
//      //ketiga, adjusting main.dart


//      //SettingsScreen(isDarkTheme: isDarkTheme, onThemeChanged: onThemeChanged),
//      const SettingsScreen(),//settings
//      const ProfileScreen(), //profile
//    ];


//    //kalo di tap itu berdasarkan index yg active, (current page)
//    //function untuk aksi tap pada buttom navbar
//   void _onItemTapped(int index) {
//   setState(() {
//     //menyatakan bahwa initial action adalah menampilkan objek yang berada pada index ke-0
//     _selectedIndex = index;
//   });
//   }
  

//   @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: false, // Menyembunyikan tombol kembali otomatis
//        backgroundColor: Colors.white, // Mengatur warna background AppBar
//        elevation: 0, // Menghilangkan bayangan pada AppBar
//        title: const Column(
//         crossAxisAlignment: CrossAxisAlignment.start,

//          children: [
//            Text(
//             "Location",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold, // Membuat teks tebal
//             ),
//            ),
//            Text(
//             "Jakarta, Indonesia",
//             style: TextStyle(
//               fontSize: 14
//             ),
//            ),
//          ],
//        ),
//        actions: [
//          IconButton(
//            onPressed: () {
//              // Navigasi ke CartScreen
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => const WishlistScreen(), // Pastikan CartScreen didefinisikan
//                ),
//              );
//            }, // Aksi ketika ikon pencarian ditekan (saat ini tidak ada fungsi)
//            icon: const Icon(Icons.favorite_border_outlined),
//          ),
//          IconButton(
//            onPressed: () {
//              // Navigasi ke CartScreen
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => const CartScreen(), // Pastikan CartScreen didefinisikan
//                ),
//              );
//            },
//            icon: const Icon(Icons.shopping_cart_outlined),
//          ),
//        ],
//      ),


//      body: _selectedIndex == 0 //artinya 1
//      ?
//      Column(
//        crossAxisAlignment: CrossAxisAlignment.start, // Menyelaraskan teks ke kiri
//        children: [
//          // Menampilkan nama dan lokasi yang dikirim dari Login
//          const Padding(
//            padding: EdgeInsets.symmetric(horizontal: dafultPadding),
//            child: Text(
//              //"Welcome ${widget.name}!", // Menampilkan nama dan lokasi di layar
//              "Welcome",
//              style: TextStyle(
//                fontWeight: FontWeight.bold,
//                fontSize: 30, // Ukuran font
//              ),
//            ),
//          ),
//          const Padding(
//            padding: EdgeInsets.symmetric(horizontal: dafultPadding),
//            child: Text(
//              //" ${widget.location}", // Menampilkan nama dan lokasi di layar
//              "Location",
//              style: TextStyle(
//                fontSize: 20, // Ukuran font
//              ),
//            ),
//          ),
//          const Categories(), // Menampilkan kategori produk
//          Expanded( // Mengisi ruang kosong di bawah kategori
//            child: SingleChildScrollView( // Membuat halaman bisa di-scroll
//              child: Column(
//                children: [
//                  const SizedBox(height: 5), // Jarak antara elemen
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: dafultPadding),
//                    child: Image.asset(
//                      'assets/images/banner_1.png', // Menampilkan gambar banner
//                      fit: BoxFit.cover, // Membuat gambar menutupi seluruh area
//                    ),
//                  ),
//                  const SizedBox(height: 20), // Menambahkan jarak antara banner dan grid
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: dafultPadding),
//                    child: GridView.builder(
//                      physics: const NeverScrollableScrollPhysics(), // Menonaktifkan scroll pada grid
//                      shrinkWrap: true, // Agar grid hanya mengambil ruang yang diperlukan
//                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                        crossAxisCount: 2, // 2 item per baris
//                        mainAxisSpacing: dafultPadding, // Jarak vertikal antar item
//                        crossAxisSpacing: dafultPadding, // Jarak horizontal antar item
//                        childAspectRatio: 0.75, // Perbandingan lebar dan tinggi item
//                      ),
//                      itemCount: product.length, // Jumlah item sesuai dengan produk yang tersedia
//                      itemBuilder: (context, index) => ItemsCard(
//                        product: product[index], // Menampilkan produk berdasarkan index
//                        press: () => Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => DetailScreen(product: product[index]), // Pindah ke DetailScreen dengan produk terpilih
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ],
//      )


//      : _widgetOptions[_selectedIndex], // Menampilkan tampilan sesuai index
//      bottomNavigationBar: BottomNavbar(
//        selectedIndex: _selectedIndex, // Kirim index aktif ke BottomNavbar
//        onItemTapped: _onItemTapped,   // Kirim fungsi untuk menangani tab
//      ),
//      // : _widgetOptions[_selectedIndex],
//      // bottomNavigationBar: botto,
    


//    );
//  }
// }





// //nadras:e-commerce
// // /Users/nanajuhana/Documents/flutter-11/e-commerce

