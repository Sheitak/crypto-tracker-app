import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';

class CoinsListUseCase {

  final CoinsListRepository _coinsListRepository;

  CoinsListUseCase(this._coinsListRepository);

  Future<List<CoinsList>> getCoinsList() {
    return _coinsListRepository.getCoinsList();
  }
}