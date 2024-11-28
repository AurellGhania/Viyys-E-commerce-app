import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {

  const ColorAndSize({super.key, required this.product});
  final Product product;  //ini itu sub class dari anak anak yg punya banyak data, yg ada di models


  @override
  Widget build(BuildContext context) {
    return 
    Row(
      children: [
        const Expanded(//buat mengisi kekosongan yg ada
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                children: [
                  ColorPicker(//ini kita tambahin argument, karna kita nambahin variable kemaren
                    color: Color(0xFF3D82AE), 
                    isSelected: true,
                    ),
                  ColorPicker(//ini kita tambahin argument, karna kita nambahin variable kemaren
                    color: Color(0xFFF8C078), 
                    isSelected: false,
                    ),
                  ColorPicker(//ini kita tambahin argument, karna kita nambahin variable kemaren
                    color: Color(0xFF989493), 
                    isSelected: false,
                    )
                ],
              )
            ],
          ),
        ),
        Expanded(
          //cara lain buat nunjukin dan modifikasikan text
          //plusnya rich text itu kalo ada tranformasi dari dark mode, ke light mode, itu tu gampang dan smothh
          //kalo ngga diatur nanti terjadi kontras itu
          //aturnya dimana? aturnya ya di main dart
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Text(
                "Size",
                style: TextStyle(color: textColor),
              ),

              RichText(//kalo di industri biasanya gunain ini, karna nanti perpindahan dark mode ke light mode nya lebih smoth
                //perbedaannya sama text biasa tu, text itu widget, kalo textspan itu bukan widget, dia itu rich text yg bisa lebih
                //bedanya text itu super class, kalo textspan adalh sub class dari rich text
                //mereka berdua tujuannya adlah sama sama buat styling dan menampilkan text
                text:  TextSpan(
                  style: const TextStyle(color: textColor),//ini itu mengimplementasikan semua, makanya dia diluar list nya
                  children: [
                    TextSpan(
                      text: "${product.size} cm",
                      //ini bikin theme nya
                      style: Theme.of(context)
                      //yg adad titik titik nya diawal, namanya method juga, ini termasuk baru buat aurell
                      //kalo nyebut canvas, canvas itu scaffold
                      //.textTheme itu Text with a color that contrasts with the card and canvas colors
                      //jadi kalo bahasa singkatnya dia warnanya bakal contras sama canvas nya, jadi dia gampang buat light mode dan dark mode
                      //ini sangat membantu buat user ngasih prefrensi ketika sukanya dark moe
                      .textTheme
                      .titleLarge!//kita disini lansung manggil method aja, tanpa kita mangil font nya
                      .copyWith(fontWeight: FontWeight.bold)
              
              
                    ),
                  ]
                ),
              
              ),
            ],
          )
        )
      ],
    );

    //kalo di android itu Intent, kalo di flutter itu navigation, itu berdua tujuannya buat berpindah
    //Explicit-> berpindah langsung
    //Implicit-> berpindah dengan bawa data
    //explicit pindah, tapi tidak bawa apa apa
    //data data yg di detail screnn itu implicit
    //karna kita udah ngbawa data
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  //kalo nama class nya eror, itu berarti parameternya belom terjadi, jadi nanti tinggal control titik aja
  final Color color;
  final bool isSelected;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(//only kalo mau ngaih jarak tapi harus kasih value,top,left rigth dll
        top: dafultPadding,
        right: dafultPadding
      ),
      padding: const EdgeInsets.all(2.5),
      width: 20,
      height: 20,

      //ini adalah modifikasi untuk border dari color picker nya
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent //kalo warna nya ke klik atau aktif, nanti

        )
      ),

      child: DecoratedBox(//karna decorated box bisa manggil widget, karna box decoration ga ada argument khusu yg memanggil widget, kalo mau lebih luas lagi kita manggil ini decorated
        //kalo ini adalah modifikasi untuk color picker nya
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
          //method extraction buat membuat method kita reusable, jadi bisa dipake terus, tinggal ambil datannya aja di models
        )
      ),
    );
  }
}