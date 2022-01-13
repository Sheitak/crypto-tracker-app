import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:dartz/dartz.dart';

abstract class CoinsListRepository<T> {
  Future<Either<FailureR, List<CoinsList>>> getCoinsList();
}