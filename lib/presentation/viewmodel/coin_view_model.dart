import 'dart:convert';

import 'package:crypto_tracker_app/core/providers/app_provider.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/usecases/get_coin_by_id.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final coinViewModelProvider = FutureProvider.autoDispose.family<Coin?, String>((ref, selectedCoin) async {
//   return ref.read(coinUseCaseProvider).getCoinById(selectedCoin);
// });

// class CoinViewModel {
//
//   final CoinUseCase _coinUseCase;
//
//   CoinViewModel(this._coinUseCase);
//
//   Future<Coin?> getCoinById(String selectedCoin) {
//     var test = _coinUseCase.getCoinById(selectedCoin);
//
//     return test;
//   }
//
//   // set dbImage(String element) => image = ImageResponse.fromJson(
//   //     json.decode(element).map((key, value) => MapEntry(key as String, value as dynamic))
//   // );
//
// }

// final coinAsyncController = StateNotifierProvider<CoinAsyncNotifier>((ref) => CoinAsyncNotifier(ref.read));
// class CoinAsyncNotifier extends StateNotifier<AsyncValue<String>>{
//
//   // final CoinUseCase _coinUseCase;
//   final Reader read;
//
//   CoinAsyncNotifier(this.read) : super(AsyncLoading()) {
//     _init();
//   }
//
//   void _init() async {
//     await read(coinUseCaseProvider).getCoinById('bitcoin');
//     state = AsyncData('01coin');
//   }
//
//   void changeCoin() async {
//     state = AsyncLoading();
//     // String coin = await read(coinUseCaseProvider).getCoinById();
//     String coin = (await read(coinUseCaseProvider).getCoinById('ethereum')) as String;
//     state = AsyncData(coin);
//   }
// }