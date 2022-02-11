import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/presentation/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/core/providers/app_provider.dart';

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
      debugShowCheckedModeBanner: false,
    );
  }
}