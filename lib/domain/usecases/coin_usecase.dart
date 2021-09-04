import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';

class CoinUseCase {

  final CoinRepository _coinRepository;

  CoinUseCase(this._coinRepository);

  Future<Coin> getCoinById(String selectedCoin) {
    return _coinRepository.getCoinById(selectedCoin);
  }
}