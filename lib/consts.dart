import 'package:flutter/material.dart';

//const itu menyimpen hal hal yg tidak bisa kita ubah, terus reusable

// Primary Color definition
const primaryColor = Color(0xFF009944);
const primaryLightColor = Color(0xFF6750A4);
const secondaryDarkColor = Color(0xFFC7B5F1);
const primaryGradientColor = LinearGradient(
  colors: [
    Color(0xFFFFA53E),
    Color(0xFFFF7643),
  ]);

// Secondary Color definition
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);

// animation duratiom time definition
const animationDuration = Duration(milliseconds: 200);

// default constant value for padding size

const dafultPadding = 20.0;

Color blue1 = const Color(0xFF0281A0);


TextStyle regular12_5 =
    const TextStyle(fontFamily: 'SF-Pro-Display', fontSize: 12.5);

TextStyle semibold12_5 = regular12_5.copyWith(fontWeight: FontWeight.w600);
TextStyle semibold14 = semibold12_5.copyWith(fontSize: 14, letterSpacing: 0.1);

TextStyle bold16 = regular12_5.copyWith(
    fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.1);