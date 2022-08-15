import 'package:flutter/material.dart';

class CustomButtonText extends Text {
  CustomButtonText(String data, {
    Key? key,
    color = Colors.white,
    textAlign = TextAlign.center,
    fontSize = 18.0
  }) : super(
      data,
      key: key,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize
      )
  );
}

class CustomCryptoText extends Text {
  CustomCryptoText(String data, {
    Key? key,
    color = Colors.white,
    fontSize = 15.0,
    fontWeight = FontWeight.w500
  }) : super(
      data,
      key: key,
      style: TextStyle(
          color: const Color(0xff27323F),
          fontSize: fontSize,
          fontWeight: fontWeight
      )
  );
}

class CustomTitleSection extends Text {
  CustomTitleSection(String data, {
    Key? key,
    color = Colors.blue,
    fontSize = 15.0,
    fontWeight = FontWeight.w600
  }) : super(
      data,
      key: key,
      style: TextStyle(
          color: Colors.indigo[700],
          fontSize: fontSize,
          fontWeight: fontWeight
      )
  );
}