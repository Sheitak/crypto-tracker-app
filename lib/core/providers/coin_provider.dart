import 'package:crypto_tracker_app/data/datasources/remote/coin_remote_api.dart';
import 'package:crypto_tracker_app/data/repositories/coin_repository_impl.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:crypto_tracker_app/domain/usecases/coin_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final remoteCoinApiProvider = Provider<CoinRemoteApi>((ref) => CoinRemoteApi());

final coinRepositoryProvider = Provider<CoinRepository>((ref) => CoinRepositoryImpl(ref.read(remoteCoinApiProvider)));

final coinUseCaseProvider = Provider<CoinUseCase>((ref) => CoinUseCase(ref.read(coinRepositoryProvider)));

final coinViewModelProvider = FutureProvider.autoDispose.family<Coin, String>((ref, selectedCoin) async {
  return ref.read(coinUseCaseProvider).getCoinById(selectedCoin);
});
