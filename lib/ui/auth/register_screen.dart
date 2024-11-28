import 'package:e_commerce/ui/Login/login.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();//globalkey nya untuk memberitaukan developer kalo misal
  //pokoknya globalkey label dari login page
  //jadi kalo developer mau cari, itu tuh udh ada labelnya
  //kalo error udah muncul di devtools nya
  //menandakan bahwa proses yg terjadi di login screen
  //form key dipanggil lagi waktu pembuatan form nya
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final  nameController = TextEditingController();
  final  locationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        ),
        body: Container(
          height: double.infinity,//untuk memenuhi layar
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.green.shade100
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            )
          ),
          child: Padding( //body buat masukin isi isiannya, kyk body html
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,//ini yg tadi kita buat di atas, di dalam form key ada global key
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create an Account!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Username*",
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username Required";
                      }
                      return null;//dia bakal ga return apa apa dia bakal pindah ke next screen
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email*",
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Required";
                      }
                      if (!value.endsWith("@gmail.com")) {
                        return "Pleaase fill with valid email";
                      }
                      return null;//dia bakal ga return apa apa dia bakal pindah ke next screen
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password*",
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password Required";
                      }
                      return null;//dia bakal ga return apa apa dia bakal pindah ke next screen
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        //if the validation succes it will navigete to home scereen
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => const CatalogueScreen(
                        //name: nameController.text, // Mengirim data nama
                        //location: locationController.text, // Mengirim data lokasi
                      ),
                      )
                          );
                      }
                    },
                    child: const Text("login")
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()
                        ));
                      }, 
                      child: const Text(
                        "Sudah punya akun? daftar disini"
                      ))
                  
                ],
              )),
          ),
        ),
    );
  }
}