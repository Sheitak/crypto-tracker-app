import 'package:crypto_tracker_app/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new CustomButtonText(
          "Loading...",
          color: Colors.blue,
          fontSize: 30.0,
        )
    );
  }
}