import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/payment/components/categories_payment.dart';
import 'package:e_commerce/ui/payment/components/pembayaran.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.green.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.30),
                      padding: const EdgeInsets.only(
                        top: dafultPadding,
                        left: dafultPadding,
                        right: dafultPadding,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )
                      ),
                  
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Expanded(
                              child: CategoriesPayment()
                            )
                          ],
                        ),
                      ),
                    ),
                      Positioned(
                        // ignore: sort_child_properties_last
                      top: size.height * 0.09,
                      left: dafultPadding / 1,
                      right: dafultPadding /1 ,
                      child: const Gopay()

                    ),
                  ],
                ),
              )
            
            ],
          ),
        ),
      ),
    );
  }
}
