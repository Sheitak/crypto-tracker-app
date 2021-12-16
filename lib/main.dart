import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/presentation/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/providers/app_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final objectBox = await ObjectBoxDatabase.initialization();
  runApp(
      ProviderScope(
          overrides: [
            objectBoxDatabaseProvider.overrideWithValue(objectBox)
          ],
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Tracker App',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Colors.indigo.shade800,
          primaryVariant: Colors.red,
          secondary: Colors.green,
          onBackground: Colors.green,
          onSecondary: Colors.blue,
          onError: Colors.blue,
          brightness: Brightness.light,
          onPrimary: Colors.white,
          surface: Colors.blue,
          onSurface: Colors.blue,
          background: Colors.blue,
          error: Colors.red.shade100,
          secondaryVariant: Colors.blue
        )
      ),

      // theme: ThemeData(
      //   primaryColor: Colors.blueGrey[100],
      // ),
      debugShowCheckedModeBanner: false,
    );
  }
}