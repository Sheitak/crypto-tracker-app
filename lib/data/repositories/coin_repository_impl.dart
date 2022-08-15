import 'dart:async';
import 'package:crypto_tracker_app/core/error/exception.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/network/network_info.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';

class CoinRepositoryImpl extends CoinRepository {

  final CryptoRemoteDataSource cryptoRemoteDataSource;
  final CryptoLocalDataSource cryptoLocalDataSource;
  final CryptoRequest cryptoRequest;
  final NetworkInfo networkInfo;

  CoinRepositoryImpl({
      required this.cryptoRemoteDataSource,
      required this.cryptoLocalDataSource,
      required this.cryptoRequest,
      required this.networkInfo
  });

  @override
  Future<Either<Failure, List<dynamic>>> getCoinById(String selectedCoin) async {
    if (await networkInfo.isConnected) {
      try {
        final entitiesList = await _getRemoteDataCoinById(selectedCoin);
        cryptoLocalDataSource.cacheCoin(entitiesList);
        final localCoin = await cryptoLocalDataSource.getLastCoin(selectedCoin);
        return Right(localCoin);
        // return Right(entitiesList);
      } on ServerException {
        return const Left(
            ServerFailure()
        );
      }
    } else {
      try {
        final localCoin = await cryptoLocalDataSource.getLastCoin(selectedCoin);
        return Right(localCoin);
      } on CacheException {
        return const Left(
            CacheFailure()
        );
      }
    }
  }

  Future<List<dynamic>> _getRemoteDataCoinById(String selectedCoin) async {
    return await cryptoRemoteDataSource.getCoinById(selectedCoin, cryptoRequest).then(
        (value) => value.toEntities()
    );
  }

  @override
  Future<Either<Failure, int>> getCoinsFavoritesNumbers() async {
    try {
      final numberFavorites = await cryptoLocalDataSource.getCoinsFavoritesNumbers();
      return Right(numberFavorites);
    } on ServerException {
      return const Left(
        ServerFailure()
      );
    }
  }
}