import 'package:crypto_tracker_app/domain/entities/coin.dart';

abstract class CoinRepository {
  Future<Coin> getCoinById(String selectedCoin);
}