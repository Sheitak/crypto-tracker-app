import 'package:crypto_tracker_app/domain/entities/coins_list.dart';

abstract class CoinsListRepository {
  Future<List<CoinsList>> getCoinsList({
    required int numCoins
  });
}