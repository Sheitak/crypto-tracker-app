import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/usecases/usecase.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:dartz/dartz.dart';

class GetCoinsList implements UseCase<List<CoinsList>, NoParams> {

  final CoinsListRepository _coinsListRepository;

  GetCoinsList(this._coinsListRepository);

  @override
  Future<Either<FailureR, List<CoinsList>>> call(NoParams params) async {
    return await _coinsListRepository.getCoinsList();
  }
}