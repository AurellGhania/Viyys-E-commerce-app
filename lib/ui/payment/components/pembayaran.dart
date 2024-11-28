import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Gopay extends StatelessWidget {
  const Gopay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      child: Container(
        height: 110,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.blue, 
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBBBBBB),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: 2,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 11,
                    width: 118,
                    decoration: const BoxDecoration(
                      color: Color(0xFF9CCDDB),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 80,
                    width: 127,
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/gopay.png',
                          height: 14,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Rp12.379',
                          style: bold16.copyWith(color: Colors.black54),
                          overflow: TextOverflow.ellipsis,  // Menambahkan overflow jika teks terlalu panjang
                        ),
                        Text(
                          'Klik & cek riwayat',
                          style: semibold12_5.copyWith(color: Colors.green),
                          overflow: TextOverflow.ellipsis,  // Menambahkan overflow jika teks terlalu panjang
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Menggunakan Flexible untuk menghindari overflow dan menyusun ikon secara rapi
            ...gopayIcons.map((icon) => Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Menggunakan Icon widget untuk ikon yang berbasis Material Icons
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon["icon"], // Mengakses ikon dari Map
                      size: 16,
                      color: Colors.green, // Menentukan warna ikon
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    icon["text"],  // Mengakses teks dari Map
                    style: semibold12_5.copyWith(color: Colors.white),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> gopayIcons = [
  {"icon": Icons.arrow_upward, "text": "Bayar"},
  {"icon": Icons.add, "text": "Top up"},
  {"icon": Icons.rocket_launch, "text": "Eksplor"},
];
