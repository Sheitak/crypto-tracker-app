import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CoinRepository<T> {
  Future<Either<FailureR, List>> getCoinById(String selectedCoin);
}