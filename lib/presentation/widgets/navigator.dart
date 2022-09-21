import 'package:crypto_tracker_app/presentation/pages/about_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/coin_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/coins_list_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/support/support_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/support/create_ticket_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/home_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/profile_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/support/tickets_screen.dart';
import 'package:crypto_tracker_app/presentation/pages/wallet_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/app_provider.dart';
import '../pages/auth_checker.dart';
import '../pages/error_screen.dart';
import '../pages/favorites_screen.dart';
import '../pages/loading_screen.dart';
import '../pages/login_screen.dart';
import '../pages/settings_screen.dart';
import '../pages/support/tickets_details_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(
            builder: (context) => const AuthChecker()

            // builder: (context) => initialize.when(
            //   data: (data) {
            //     return const AuthChecker();
            //   },
            //   loading: () => const LoadingScreen(),
            //   error: (e, stackTrace) => ErrorScreen(e, stackTrace!)
            // ),
        );
      case '/home' :
        return MaterialPageRoute(
            builder: (context) => const HomeScreen()
        );
      case '/cryptocurrencies':
        return MaterialPageRoute(
            builder: (context) => const CoinsListScreen()
        );
      case '/cryptocurrency':
        var arguments = settings.arguments;
        if (arguments != null) {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => CoinScreen(selectedCoin: arguments as String),
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
        return MaterialPageRoute(
            builder: (context) => const WalletScreen()
        );
      case '/profile' :
        return MaterialPageRoute(
            builder: (context) => const ProfileScreen()
        );
      case '/favorites' :
        return MaterialPageRoute(
            builder: (context) => const FavoritesScreen()
        );
      case '/settings' :
        return MaterialPageRoute(
            builder: (context) => const SettingsScreen()
        );
      case '/about' :
        return MaterialPageRoute(
            builder: (context) => const AboutScreen()
        );
      case '/support' :
        return MaterialPageRoute(
            builder: (context) => const SupportScreen()
        );
      case '/create-ticket-support' :
        return MaterialPageRoute(
            builder: (context) => const CreateTicketScreen()
        );
      case '/tickets' :
        return MaterialPageRoute(
            builder: (context) => const TicketsScreen()
        );
      case '/ticket' :
        var arguments = settings.arguments;
        if (arguments != null) {
          return MaterialPageRoute(
              builder: (context) => TicketsDetailsScreen(ticketId: arguments as String)
          );
        } else {
          return pageNotFound();
        }
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