import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Menggunakan controller untuk menangkap input user
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"), // Membuat title pada app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Membuat field untuk memasukkan nama
            TextField(
              controller: nameController, // Menghubungkan controller ke TextField
              decoration: const InputDecoration(labelText: "Nama"), // Menambahkan label untuk TextField
            ),
            const SizedBox(height: 16), // Membuat jarak antara field nama dan lokasi
            // Membuat field untuk memasukkan lokasi
            TextField(
              controller: locationController, // Menghubungkan controller ke TextField
              decoration: const InputDecoration(labelText: "Lokasi"), // Menambahkan label untuk TextField
            ),
            const SizedBox(height: 32), // Menambahkan jarak sebelum tombol
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CatalogueScreen(
                      //name: nameController.text, // Mengirim data nama
                      //location: locationController.text, // Mengirim data lokasi
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009944), // Warna background tombol menjadi hijau
                foregroundColor: Colors.white, // Warna teks menjadi putih
              ),
              child: const Text("Submit"), // Teks pada tombol
            ),


          ],
        ),
      ),
    );
  }
}
