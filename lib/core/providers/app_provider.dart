import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/data/datasources/remote/coin_list_remote_api.dart';
import 'package:crypto_tracker_app/data/datasources/remote/coin_remote_api.dart';
import 'package:crypto_tracker_app/data/repositories/coin_repository_impl.dart';
import 'package:crypto_tracker_app/data/repositories/coins_list_repository_impl.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:crypto_tracker_app/domain/usecases/coin_usecase.dart';
import 'package:crypto_tracker_app/domain/usecases/coins_list_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// APP PROVIDERS
final objectBoxDatabaseProvider = Provider<ObjectBoxDatabase>((ref) => throw UnimplementedError());

// COIN PROVIDERS
final remoteCoinApiProvider = Provider<CoinRemoteApi>((ref) => CoinRemoteApi());

final coinRepositoryProvider = Provider<CoinRepository>((ref) => CoinRepositoryImpl(
    ref.read(remoteCoinApiProvider),
    ref.read(objectBoxDatabaseProvider)
));

final coinUseCaseProvider = Provider<CoinUseCase>((ref) => CoinUseCase(
    ref.read(coinRepositoryProvider)
));

final coinViewModelProvider = FutureProvider.autoDispose.family<List, String>((ref, selectedCoin) async {
  return ref.read(coinUseCaseProvider).getCoinById(selectedCoin);
});

// COINS LIST PROVIDERS
final coinListRemoteApiProvider = Provider<CoinListRemoteApi>((ref) => CoinListRemoteApi());

final coinsListRepositoryProvider = Provider<CoinsListRepository>((ref) => CoinsListRepositoryImpl(
    ref.read(coinListRemoteApiProvider),
    ref.read(objectBoxDatabaseProvider)
));

final coinsListUseCaseProvider = Provider<CoinsListUseCase>((ref) => CoinsListUseCase(
    ref.read(coinsListRepositoryProvider)
));

final coinsListViewModelProvider = FutureProvider.autoDispose<List<CoinsList>>((ref) async {
  return ref.read(coinsListUseCaseProvider).getCoinsList();
});