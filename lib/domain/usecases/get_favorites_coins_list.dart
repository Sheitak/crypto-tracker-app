import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/domain/usecases/usecase.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:dartz/dartz.dart';

class GetFavoritesCoinsList implements UseCase<List<CoinsList>, NoParams> {

  final CoinsListRepository coinsListRepository;

  GetFavoritesCoinsList({
    required this.coinsListRepository
  });

  @override
  Future<Either<Failure, List<CoinsList>>> call(NoParams params) async {
    return await coinsListRepository.getFavoritesCoinsList();
  }
}