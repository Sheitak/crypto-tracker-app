import 'package:crypto_tracker_app/presentation/pages/home.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}