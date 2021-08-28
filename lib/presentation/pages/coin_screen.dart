import 'package:crypto_tracker_app/presentation/viewmodel/coin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/presentation/widgets/error.dart';

class CoinScreen extends ConsumerWidget {
  final String selectedCoin;
  CoinScreen(this.selectedCoin);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Tracker App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/wallet')
            },
            icon: Icon(Icons.account_balance_wallet_outlined),
          )
        ],
      ),
      body: Container(
        child: Consumer(builder: (BuildContext context, watch, child) {
        return watch(coinViewModelProvider(selectedCoin)).when(
            data: (coin) {
              return Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      new Text('${coin.id}'),
                      new Text('${coin.algorithm}'),
                      new Text('${coin.links.subredditUrl}'),
                      new Text('${coin.communityData}'),
                    ],
                  )
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) =>
                Error(message: error.toString(), callback: () => {}));
      })
      ),
    );
  }
}