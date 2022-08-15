import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/providers/app_provider.dart';
import '../widgets/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Tracker App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/wallet')
            },
            icon: const Icon(Icons.account_balance_wallet_outlined),
          )
        ],
      ),
      drawer: DrawerWidget(context),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final data = ref.watch(fireBaseAuthProvider);
          final String username = data.currentUser!.displayName ?? 'unknown';
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: Text('Your name : ${data.currentUser!.displayName}'),
                  child: Text('Your name : $username'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Your email address : ${data.currentUser!.email}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Your UID : ${data.currentUser!.uid}'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
