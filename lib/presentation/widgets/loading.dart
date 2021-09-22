import 'package:crypto_tracker_app/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomButtonText(
          "Loading...",
          color: Colors.blue,
          fontSize: 30.0,
        )
    );
  }
}