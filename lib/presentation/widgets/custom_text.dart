import 'package:flutter/material.dart';

class CustomButtonText extends Text {
  CustomButtonText(String data, {
    color: Colors.white,
    textAlign: TextAlign.center,
    fontSize: 18.0
  }) : super(
      data,
    textAlign: textAlign,
    style: new TextStyle(
      color: color,
      fontSize: fontSize
    )
  );
}

class CustomCryptoText extends Text {
  CustomCryptoText(String data, {
    color: Colors.white,
    fontSize: 15.0
  }) : super(
      data,
      style: new TextStyle(
          color: Color(0xff27323F),
          fontSize: fontSize
      )
  );
}