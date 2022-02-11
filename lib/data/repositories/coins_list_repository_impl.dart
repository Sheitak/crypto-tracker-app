import 'package:crypto_tracker_app/core/error/exception.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:crypto_tracker_app/core/network/network_info.dart';
import 'package:dartz/dartz.dart';

class CoinsListRepositoryImpl extends CoinsListRepository {

  final CryptoRemoteDataSource cryptoRemoteDataSource;
  final CryptoLocalDataSource cryptoLocalDataSource;
  final NetworkInfo networkInfo;
  
  CoinsListRepositoryImpl({
      required this.cryptoRemoteDataSource,
      required this.cryptoLocalDataSource,
      required this.networkInfo
  });

  @override
  Future<Either<Failure, List<CoinsList>>> getCoinsList() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCoinsList = await _getRemoteDataListCoins();
        cryptoLocalDataSource.cacheCoinsList(remoteCoinsList);
        return Right(remoteCoinsList);
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
        return Left(
            CacheFailure()
        );
      }
    }
  }

  Future<List<CoinsList>> _getRemoteDataListCoins() async {
    return await cryptoRemoteDataSource.getCoinsList(
        const CoinsListRequest(includePlatform: false)
    ).then(
      (value) => value.map(
            (element) => element.toEntity()
      ).toList()
    );
  }
}