import 'package:crypto_tracker_app/core/error/exception.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:crypto_tracker_app/core/network/network_info.dart';
import 'package:dartz/dartz.dart';

class CoinsListRepositoryImpl extends CoinsListRepository {

  final CryptoRemoteDataSource cryptoRemoteDataSource;
  final CryptoLocalDataSource cryptoLocalDataSource;
  final CryptoRequest cryptoRequest;
  final NetworkInfo networkInfo;
  
  CoinsListRepositoryImpl({
      required this.cryptoRemoteDataSource,
      required this.cryptoLocalDataSource,
      required this.cryptoRequest,
      required this.networkInfo
  });

  @override
  Future<Either<Failure, List<CoinsList>>> getCoinsList() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCoinsList = await _getRemoteDataListCoins();
        cryptoLocalDataSource.cacheCoinsList(remoteCoinsList);
        final localCoinsList = await cryptoLocalDataSource.getLastCoinsList();
        return Right(localCoinsList);
        // return Right(remoteCoinsList);
      } on ServerException {
        return const Left(
            ServerFailure()
        );
      }
    } else {
      try {
        final localCoinsList = await cryptoLocalDataSource.getLastCoinsList();
        return Right(localCoinsList);
      } on CacheException {
        return const Left(
            CacheFailure()
        );
      }
    }
  }

  Future<List<CoinsList>> _getRemoteDataListCoins() async {
    return await cryptoRemoteDataSource.getCoinsList(cryptoRequest).then(
      (value) => value.map(
            (element) => element.toEntity()
      ).toList()
    );
  }

  @override
  Future<Either<Failure, List<CoinsList>>> getFavoritesCoinsList() async {
    try {
      final localCoinsList = await cryptoLocalDataSource.getFavoritesCoinsList();
      return Right(localCoinsList);
    } on ServerException {
      return const Left(
          ServerFailure()
      );
    }
  }

  @override
  Future<bool> updateFavorites(String selectedCoin) async {
    return await cryptoLocalDataSource.updateFavorites(selectedCoin);
  }

  @override
  Future<int> getCoinsFavoritesNumbers() {
    // TODO: implement getCoinsFavoritesNumbers
    throw UnimplementedError();
  }


}