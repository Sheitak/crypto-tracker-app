import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:dartz/dartz.dart';

abstract class CryptoRepository<T> {
  Future<Either<Failure, List<dynamic>>> getCoinById(String selectedCoin);
  Future<Either<Failure, List<CoinsList>>> getCoinsList();
}