import 'package:e_commerce/consts.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.text, required this.image,
  });
  final String text, image;


  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      //const Spacer(),
      Text(
        'Viyys',
        style: TextStyle(
          color: primaryColor,
          fontSize: getPropotinateScreenWidht(36.0),
          ),
        ),
        Text (
          text,
          textAlign: TextAlign.center,
          ),
        Image.asset(image), // Use Image.asset to load asset images
    ],
            );
  }
}
