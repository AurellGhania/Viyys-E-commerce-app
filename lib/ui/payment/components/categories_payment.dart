import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class CategoriesPayment extends StatefulWidget {
  const CategoriesPayment({super.key});

  @override
  State<CategoriesPayment> createState() => _CategoriesPaymentState();
}

// State atas untuk menyimpan apa yg digunakan oleh super class
// State bawah buat variable-variable kecil
class _CategoriesPaymentState extends State<CategoriesPayment> {
  // List itu kurung kotak []
  // Kalo map itu kurung kurawal {}
  // Kalo ini list, pengambilan nya juga harus list, gabisa langsung dipanggil
  
  List<Map<String, dynamic>> categories = [
    {"icon": Icons.credit_card, "text": "Top up"},
    {"icon": Icons.hotel, "text": "Hotel"},
    {"icon": Icons.card_giftcard, "text": "Bonus"},
    {"icon": Icons.credit_card, "text": "Top up"},
    {"icon": Icons.hotel, "text": "Hotel"},
    {"icon": Icons.card_giftcard, "text": "Bonus"},
    {"icon": Icons.credit_card, "text": "Top up"},

  ];
  int selectedIndex = 0; // Buat ngasi tau perubahan indexnya

  @override
  Widget build(BuildContext context) {
    // Ini buat bikin daftar kategori yang bisa di-scroll dan kasih jarak vertikal
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and view all
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Features",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor, // Pastikan textColor sudah didefinisikan
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Implementasikan navigasi atau fungsi lainnya
                },
                child: const Text(
                  "view all",
                  style: TextStyle(
                    color: Color(0xFF236A91),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: dafultPadding), // Menggunakan defaultPadding

          // Horizontal list of categories with icons
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1,
            children: List.generate(
              categories.length,
              (index) => _buildCategory(categories[index], index)
            )

            
          )
        ],
      ),
    );
  }

  GestureDetector _buildCategory(Map<String, dynamic> category, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; 
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: dafultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10), 
              decoration: BoxDecoration(
                color: selectedIndex == index ? primaryColor.withOpacity(0.1) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                categories[index]["icon"],
                color: selectedIndex == index ? primaryColor : Colors.green.shade300,
                size: 20,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              categories[index]["text"],
              style: TextStyle(
                color: selectedIndex == index ? primaryColor : Colors.green.shade300,
                fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
