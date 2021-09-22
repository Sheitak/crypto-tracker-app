import 'package:crypto_tracker_app/presentation/pages/coin_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/coins_list_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/wallet_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (context) => const CoinsListScreen());
      case '/cryptocurrencies':
        var arguments = settings.arguments;
        if (arguments != null) {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => CoinScreen(selectedCoin: arguments as String),
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) {
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
        return MaterialPageRoute(builder: (context) => const WalletScreen());
      default:
        return pageNotFound();
    }
  }

  static MaterialPageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (context) =>
            Scaffold(
                appBar: AppBar(
                    title: const Text("Error"),
                    centerTitle: true
                ),
                body: const Center(
                  child: Text("Page not found"),
                )
            )
    );
  }
}