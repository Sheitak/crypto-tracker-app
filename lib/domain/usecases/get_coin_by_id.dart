import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/usecases/usecase.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCoinById implements UseCase<List, Params> {

  final CoinRepository _coinRepository;

  GetCoinById(this._coinRepository);

  @override
  Future<Either<FailureR, List>> call(Params params) async {
    return await _coinRepository.getCoinById(params.selectedCoin);
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