import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/Login/login.dart';
import 'package:e_commerce/ui/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

//Secara sederhana, StatelessWidget untuk UI yang tetap, dan StatefulWidget untuk UI yang bisa berubah.
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

//widget extraction itu untuk memisah logic dan juga widget nya, jadi yg diatas itu logic nya yg dibawah itu widgetnya

class _BodyState extends State<Body> {
  int currentPage = 0;
  //for controlling our route yg di page builder ya ga si? bisa jg dibilang buat dia ke catalogue screen
  final PageController _pageController = PageController(); 

  // List<String> product = List.generate( //wadah prduct atau genarate product
  //   10, (index) => "Product ${index + 1}"
  //   );

//daser pengambilan data dari API, padahal apin nya masih dummy, awokwowkwok
//json format kurang lebih kyk gini, kayak key, value gitu
  List<Map<String, String>> splashData =[
    {
      "text" : "Welcome to viyys Let's Shop!",
      "image" : "assets/images/on-boarding-1.png",
    },
    {
      "text" : "We sell a various product around jakarta \n and around the world",
      "image" : "assets/images/on-boarding-1.png",
    },
    {
      "text" : "Let's make a big changes \nthrough a better e-commerce app",
      "image" : "assets/images/on-boarding-1.png",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( //for make our project ga kektutupan ama system hpnya
        child: Column(
          children: [
            Expanded //buat mengisi kekosongan yg ada, biar isinya proposinal
            (
              flex: 3, //untuk ngasih jarak 3 column dan 3 row utk itu berada
              child: SizedBox(// in tuh buat dia buat space gitu lh(jarak antara widget2), kalo tanpa ini ga bisa pake widht apa height, dan jg gabisa pake double.infinity
                width: double.infinity,//ini tuh buat bikin ke tengah, jadi dia akan memenuhi layar yg ada, bisa dibilang dia akan ngestract jadi dia bakal ke tengah, dengan titk kordinat 0
                child: PageView.builder( //pageview meng handle swipe swipe activity
                  controller: _pageController,
                  onPageChanged: (value)  { //kalo perlu argument/sesuatu yg mewakili integer kita bisa taro value
                      //initial state method for statefull widfet behavior
                      //state awal utk perubahan yg akan terjadi, di dalam state full ada state method
                      //kalo mengawali statefull behavior
                      setState(() { // set itu perubahan state, untuk perubahan gitu cuenah
                        currentPage = value;// manggil integer representatif yg udh kita panggil di awal, dia mengambil data dari page pertama
                      });
                    },
                  itemCount: splashData.length, //utk memberikan batasan slide, length nya utk mendeinisikan pangjang array nya berapa

                  itemBuilder: (context, index) => SplashContent(//mrmbangun halaman spalsh dari spalsh contentnya, membangun antara data danui
                    text: splashData[index]["text"]! , //ini pake tanda seru karna itu important, dia bang opperator
                    image:  splashData[index]["image"]!
                    )
                  //context mereprentasikan halaman sekarang
                  //index itu, list di akses dengan index
                  //buider bisa di pake dimana aja, disini kita pake di pageview, biar pas
                ),
              ),
            ),
           Expanded(//untuk membuat tata letak yang fleksibel dan responsif dengan memanfaatkan ruang kosong yang tersedia secara proporsional dalam Row, Column, atau Flex.
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Aligns the dots in the center
            //list generate: buat ngehasilin widgets dot sesui dengan panjang data di spalsh data, kalo ada 10 data bakal ada 10 slide
            children: List.generate(
              splashData.length, //index karana dibuat dari 0, underscore itu buat method  extraction
              (index) => _dotIndicator(index: index), //disis index aja, karna disini udh jelas kita mau kasih index
              ),
            ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, //ini tuh buat bikin ke tengah, jadi dia akan memenuhi layar yg ada, bisa dibilang dia akan ngestract jadi dia bakal ke tengah
                child: ElevatedButton( 
                  style: ElevatedButton.styleFrom( //elevated button itu button yg paling normal, belom ada styling jadi bisa kita styling pake ini

                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.all(8)
                  ),

                  onPressed: () {
                    if (currentPage == splashData.length - 1) { //code utk digunakan berpindah halaman, navigasi itu berpindah
                    //splash data length minus satu itu data terakhir
                    //karna current page nya dari 0, biar
                    //data yg terakhir iru 2, jadi 3 dikurang 1 jadi 2


                    //trigger event, ketika user melakukan aksi klik pada suatu object
                      // Aksi untuk halaman terakhir, pindah ke halaman utama
                      //what is length? panjangnya data/banyanknya data
                      Navigator.push(//kode yg digunakan untuk berpindah untuk halaman
                        context, //context itu represantisikan currrent page kita
                        MaterialPageRoute(// ini route untuk berpindah
                          builder: (context) => const Login()
                          ));
                      
                    } else {
                        // Berpindah ke halaman splash berikutnya
                        //kalo dia di awal, dia bakal mau slide ke sebelumnya, maka nya ditambah 1
                        //kalo blm dihalaman akhir, button ini akan menggerakan ke halaman berikutnya
                        _pageController.animateToPage(
                        currentPage + 1,  // Geser ke halaman berikutnya
                        duration: animationDuration,  // Durasi animasi
                        curve: Curves.easeIn,  // Kurva animasi
                      );

                        
                      

                      
                    }
                  },// onpressed for acion,() => {} dummy (represntasi dari function yg kosong) ngasih function mau ke mana
                 //"expresion" kalo di code itu kayak di block code
                  child: Text( 
                    currentPage == splashData.length - 1 ? "Start" : "Next",
                    //kao dia datanya udah ketiga diabakal ke start, kalo b
                    
                    style: const TextStyle(
                      color: Colors.white,
                      
                    ),
                  ),
                 //"intensitas" itu frekuensi
                 
                 
                 ),
              ),
            )
          ],
        ),
        
      )
  
    );
  }

  //code untuk code indicator

  AnimatedContainer _dotIndicator({required int index}) {
  return AnimatedContainer(
    duration: animationDuration, // Durasi animasi (300ms)
    curve: Curves.easeInOut, // Kurva animasi untuk transisi yang lebih halus
    
    margin: const EdgeInsets.only(right: 10), // Jarak antar titik
    width: currentPage == index ? 20 : 10,
    //kalo dia dihalaman yg aktif widht nya bakal ubah ke 20 dan warnanya primary, kalo halaman ga akti ya abu dan bulet
    height: 10,
    decoration: BoxDecoration(
      color: currentPage == index ? primaryColor : secondaryColor,  //ini itu if else  Warna titik aktif dan tidak aktif 
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

}
