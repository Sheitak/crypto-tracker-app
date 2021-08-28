import 'package:crypto_tracker_app/presentation/pages/coin_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/coins_list_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/wallet_screen.dart';
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
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      theme: ThemeData(
        primaryColor: Colors.blueGrey[100],
      ),
      // home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (context) => CoinsListScreen());
      case '/cryptocurrencies':
        var arguments = settings.arguments;
        if (arguments != null) {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => CoinScreen(arguments as String),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                animation = CurvedAnimation(
                    curve: Curves.ease,
                    parent: animation
                );
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }
          );
        } else {
          return pageNotFound();
        }
      case '/wallet' :
        return MaterialPageRoute(builder: (context) => WalletScreen());
      default:
        return pageNotFound();
    }
  }

  static MaterialPageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(
                title:Text("Error"),
                centerTitle: true
            ),
            body: Center(
              child: Text("Page not found"),
            )
        )
    );
  }
}