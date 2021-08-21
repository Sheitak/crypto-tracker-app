import 'package:flutter/material.dart';

class CustomText extends Text {
  CustomText(String data, {
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