import 'package:crypto_tracker_app/presentation/pages/home1.dart';
import 'package:crypto_tracker_app/presentation/pages/home.dart';
import 'package:crypto_tracker_app/presentation/pages/home0.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      const ProviderScope(
        child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Tracker App',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[100],
      ),
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}