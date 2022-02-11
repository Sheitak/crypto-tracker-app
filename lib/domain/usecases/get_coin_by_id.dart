import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/usecases/usecase.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../repositories/crypto_repository.dart';

class GetCoinById implements UseCase<List, Params> {

  // final CryptoRepository cryptoRepository;
  final CoinRepository coinRepository;

  GetCoinById({
    // required this.cryptoRepository
    required this.coinRepository
  });

  @override
  Future<Either<Failure, List<dynamic>>> call(Params params) async {
    return await coinRepository.getCoinById(params.selectedCoin);
    // return await cryptoRepository.getCoinById(params.selectedCoin);
  }
}

class Params extends Equatable {
  final String selectedCoin;

  const Params({
    required this.selectedCoin
  });

  @override
  List<Object?> get props => [
    selectedCoin
  ];
}