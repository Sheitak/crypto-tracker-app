import 'dart:io';
import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/presentation/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/core/providers/app_provider.dart';
import 'package:dcdg/dcdg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final objectBox = await ObjectBoxDatabase.initialization();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
      ProviderScope(
          overrides: [
            objectBoxDatabaseProvider.overrideWithValue(objectBox)
          ],
          child: const MyApp()
      )
  );
}

//!\ TODO: This should be used while in development mode, do NOT do this when you want to release to production.
// Enabled globally in project.
// https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final initialize = ref.watch(firebaseInitializerProvider);
    return MaterialApp(
      title: 'Crypto Tracker App',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Colors.indigo.shade800,
          secondary: Colors.indigo.shade600,
          onBackground: Colors.blueGrey.shade700,
          onSecondary: Colors.indigo.shade800,
          onError: Colors.red.shade800,
          brightness: Brightness.light,
          onPrimary: Colors.white,
          surface: Colors.deepPurpleAccent.shade400,
          onSurface: Colors.deepPurpleAccent.shade700,
          background: Colors.blueGrey.shade900,
          error: Colors.red.shade300
        )
      ),
      debugShowCheckedModeBanner: false
    );
  }
}