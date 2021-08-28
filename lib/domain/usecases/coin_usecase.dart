import 'package:crypto_tracker_app/data/repositories/coin_repository_impl.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final coinUseCaseProvider = Provider<CoinUseCase>((ref) => CoinUseCase(ref.read(coinRepositoryProvider)));

class CoinUseCase {

  final CoinRepository _coinRepository;

  CoinUseCase(this._coinRepository);

  Future<Coin> getCoinById(String selectedCoin) {
    return _coinRepository.getCoinById(selectedCoin);
  }
}