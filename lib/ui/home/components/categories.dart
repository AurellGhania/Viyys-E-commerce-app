import 'package:e_commerce/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


//statefull karna banyak perubahan
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}
// state atas untuk menyimpen apa yg digunakan oleh super class
//state bawah buat variable variable kecil

class _CategoriesState extends State<Categories> {
  //list itu kurung kotak []
  //kalo map itu kurung kurawal{}
  //kalo ini list, pengembailan nya juga harus list, gabisa langsung dipanggil

  //ini namanya view pager
  //data buat viewpager nya
  List<String> categories = [
    "Mix",
    "Vegetable",
    "Fruits",
    "Spice"
  ];

  int selectedIndex = 0; //untuk ngasih tau selected index dimulai dari 0, ngasih tau pertama itu mulai dari mana, ya pertama ito zero lahh
  //variable utk menyimpan index kategori yg sedang dipilih

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(vertical: dafultPadding),
      child: SizedBox(//sizedbox untuk nambahin dia ada jaraknya antara viewpager dan widget nya
        height: 27,
        //listview dibuat untuk ngslide horizontal, utk create a scrollable linear array horizontal
        
        child: ListView.builder(//builder utk menampung data, untuk nge build ui nya
        //list view, biar dia bisa discrroll secara horizontal
          scrollDirection: Axis.horizontal, // Set scrollDirection to horizontal

          itemCount: categories.length, //dari ney
          //itembuider untuk menampung data yg akan ditampilkan ui/screen
          itemBuilder: (context, index) => _buildCategory(index) //item buider crate linear scrollable, untuk ngsilde horizontal, itembuilder meng show atau menampung data
          ),
      ),
    ); 
  }

  GestureDetector _buildCategory(int index) {
    return GestureDetector( //gesture detector itu kayak buat deteksi pergerakan menggunakan pen, tapi bisa juga tidak menggunakan pen, (mendeteksi pergrakan)
      //Boiler Plate Code itu kalo itu udh di defind, trus kita defind ulang, jadi numpuk2
      // index itu buat data array
      onTap: () {
        setState(() {//untuk inisialisasi
          selectedIndex = index; //ngasih tau indexnya dibuat dari 0
          //buat index nya itu menjadi zero,di default in index nya jadi 0 dibagian sebelm override
        }
        );
      },
      // kalo to many positional argument berarti coba tambahin child, pokoknya hrrq nya salah
      
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dafultPadding), // Mengatur padding horizontal
        child: Column( // Gunakan Column untuk menampung Text dan Container
          crossAxisAlignment: CrossAxisAlignment.center, // Mengatur posisi ke tengah
          children: [
            Text(
              categories[index], // Menampilkan teks kategori
              style: TextStyle(
                color: selectedIndex == index ? primaryColor : secondaryColor, // Warna berdasarkan kondisi
                fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal, // Bold jika dipilih
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: dafultPadding / 8
                ), // Margin atas
              height: 2, // Tinggi garis
              width: 30, // Lebar garis
              color: selectedIndex == index ? primaryColor : secondaryColor, // Garis hanya muncul di item yang dipilih
            ),
          ],
        ),
      ),
    );
  }
}