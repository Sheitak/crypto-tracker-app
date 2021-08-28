import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/usecases/coin_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final coinViewModelProvider = FutureProvider.autoDispose.family<Coin, String>((ref, selectedCoin) async {
    return ref.read(coinUseCaseProvider).getCoinById(selectedCoin);
});

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

// class CoinNotifier {
//
//   final CoinUseCase _coinUseCase;
//
//   CoinNotifier(this._coinUseCase);
//
//   Future<Coin> getCoinById(String selectedCoin) {
//     return _coinUseCase.getCoinById(selectedCoin);
//   }
//
// }