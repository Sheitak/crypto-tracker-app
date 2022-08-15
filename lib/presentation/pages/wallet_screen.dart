import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

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
      body: Center(
          child: Image.asset(
              'assets/images/people-tech.png',
              fit: BoxFit.cover
          )
      ),
    );
  }
}