import 'package:crypto_tracker_app/domain/entities/coins_list.dart';

abstract class CryptoLocalDataSource {
  Future<List<CoinsList>> getLastCoinsList();
  Future<void> cacheCoinsList(List<CoinsList> coinsListToCache);

  Future<List<dynamic>> getLastCoin(String selectedCoin);
  Future<void> cacheCoin(List<dynamic> entitiesListToCache);
}