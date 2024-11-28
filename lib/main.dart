import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-manegement/cart_provider.dart';
import 'package:e_commerce/state-manegement/theme_provider.dart';
import 'package:e_commerce/state-manegement/wishlist_provider.dart';
import 'package:e_commerce/ui/auth/register_screen.dart';
//import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/ui/profile/profile_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// main itu kepala kita, kalo kita gapunya ini kita gapunya apa2, kayak microcontroller`

// shift + alt + o

// download extension
// - adb interface
// - error lense
// - prettier
// - flutter widget snipeads

//compile adalah proses penerjemahan dari bahasa koding ke bahasa mesin
//runtime  alat untuk menerjamahkan, compile adalah proses penerjemahannya
void main() {
  runApp(
    //ChangeNotifierProvider adalah dri library provider manageent, kalo ngga ter definisi, tulis pub get dan pub clean aja
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const FloShop())
    );
}

class FloShop extends StatefulWidget {
  const FloShop({super.key});

  @override
  State<FloShop> createState() => _FloShopState();
}

class _FloShopState extends State<FloShop> {


//asynchronous ketika kita menjalankan proses secara bersamaan, bukan menunggu
  //an asynchronous process
  //used for theme changing proces

  //semua future jalan kalo si usser ada action triggernya dulu



  //an asynchronous process
  //used for toggle change activity
  //toggle itu buat yg nyala mayi nyala mati itu




  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {  
          return MaterialApp(
          // material app = kerangka
          debugShowCheckedModeBanner: false,
          title: 'FloShop',
          // untuk mengidentifikasi aplikasi
          theme: ThemeData(
            brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
            fontFamily: 'Muli',
            // biar density atau kepadetan mobile app nya, buat adaptive di semua devices
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: textColor),
              bodySmall: TextStyle(color: textColor),
            ),
          ),
          //home: SettingsScreen(isDarkTheme: _isDarkTheme, onThemeChanged: _toggleTheme),
          // Tambahkan initial route untuk menuju SplashScreen
          initialRoute: '/',
          //bagaimana mengubah tema,
          //yg ter encapsulisasi itu routes nya, yg mengencapsulisasi itu material routes nya
          routes: {
            //class sama parameter itu berbeda, clas lebih tinggi derajatnya
        
            '/': (context) => const SplashScreen(),
            '/categories': (context) => const Categories(),
            '/profile': (context) => const ProfileScreen(),
            '/wishlist': (context) =>  const WishlistScreen(),
            '/register': (context) =>  RegisterScreen(),
            '/settings': (context) =>  const SettingsScreen(),
        
            // tambahkan routes lainnya di sini jika ada
          },
        );
      },
      
    );
  }
}

