import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/usecases/usecase.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:dartz/dartz.dart';
import '../repositories/crypto_repository.dart';

class GetCoinsList implements UseCase<List<CoinsList>, NoParams> {

  final CoinsListRepository coinsListRepository;
  // final CryptoRepository cryptoRepository;

  GetCoinsList({
    required this.coinsListRepository
    // required this.cryptoRepository
  });

  @override
  Future<Either<Failure, List<CoinsList>>> call(NoParams params) async {
    // return await cryptoRepository.getCoinsList();
    return await coinsListRepository.getCoinsList();
  }
}