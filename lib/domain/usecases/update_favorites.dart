import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/domain/usecases/usecase.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/coins_list_repository.dart';

class UpdateFavorites implements UseCase<bool, Params> {

  final CoinsListRepository coinsListRepository;

  UpdateFavorites({
    required this.coinsListRepository
  });

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    final test = await coinsListRepository.updateFavorites(params.selectedCoin);
    return Right(test);
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