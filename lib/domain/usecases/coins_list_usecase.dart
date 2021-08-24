import 'package:crypto_tracker_app/data/repositories/coins_list_repository_impl.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final coinsListUseCaseProvider = Provider<CoinsListUseCase>((ref) => CoinsListUseCase(ref.read(coinsListRepositoryProvider)));

class CoinsListUseCase {

  final CoinsListRepository _coinsListRepository;

  CoinsListUseCase(this._coinsListRepository);

  Future<List<CoinsList>> getCoinsList() {
    return _coinsListRepository.getCoinsList();
  }
}