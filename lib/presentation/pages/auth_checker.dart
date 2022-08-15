import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/providers/app_provider.dart';
import 'error_screen.dart';
import 'home_screen.dart';
import 'loading_screen.dart';
import 'login_screen.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateProvider).when(
        data: (data) {
          if (data != null) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
        loading: () => const LoadingScreen(),
        error: (error, trace) => ErrorScreen(error, trace!)
    );
  }
}