import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/presentation/viewmodel/coins_list_notifier.dart';
import 'package:crypto_tracker_app/presentation/viewmodel/coins_list_view_model.dart';
import 'package:crypto_tracker_app/presentation/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home.dart';

class Home0 extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final viewModelState = useProvider(coinsListViewModelProvider);
    final coinsListFuture = useProvider(coinsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('crypto tracker app'),
        centerTitle: true,
      ),
      body: coinsListFuture.when(
          data: (coinsList) => _buildBody(
              context,
              viewModelState,
              coinsList
          ),
          loading: () => const Center(
            child: CircularProgressIndicator()
          ),
          error: (error, _) => Error(
              message: error.toString(),
              callback: () => {}
          )
      )
    );
  }

  // void refreshAll(BuildContext context) {
  //   context.refresh(coinsListProvider);
  //   context.read(coinsListViewModelProvider.notifier);
  // }

  Widget _buildBody(BuildContext context, CoinsListNotifier viewModelState, List<CoinsList> coinsList) {
    if (coinsList.isEmpty) {
      return Error(
          message: 'No Cryptocurrencies found',
          callback: () => {}
      );
    }
    return ListView.builder(
      itemCount: coinsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          // title: Text(viewModelState.coinsList[index]),
        );
      },
    );
  }

}