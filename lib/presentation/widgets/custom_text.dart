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
    fontSize: 15.0,
    fontWeight: FontWeight.w500
  }) : super(
      data,
      style: new TextStyle(
          color: Color(0xff27323F),
          fontSize: fontSize,
          fontWeight: fontWeight
      )
  );
}

class CustomTitleSection extends Text {
  CustomTitleSection(String data, {
    color: Colors.blue,
    fontSize: 17.0,
    fontWeight: FontWeight.w600
  }) : super(
      data,
      style: new TextStyle(
          color: Colors.indigo[700],
          fontSize: fontSize,
          fontWeight: fontWeight
      )
  );
}