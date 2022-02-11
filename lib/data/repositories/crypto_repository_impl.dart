import 'package:crypto_tracker_app/core/error/exception.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/data/models/request/coin_request.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/core/network/network_info.dart';
import 'package:crypto_tracker_app/domain/repositories/crypto_repository.dart';
import 'package:dartz/dartz.dart';

typedef _CryptoResultsRemoteChooser = Future<List<dynamic>> Function();

class CryptoRepositoryImpl extends CryptoRepository {

  final CryptoRemoteDataSource cryptoRemoteDataSource;
  final CryptoLocalDataSource cryptoLocalDataSource;
  final NetworkInfo networkInfo;

  CryptoRepositoryImpl({
    required this.cryptoRemoteDataSource,
    required this.cryptoLocalDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<dynamic>>> getCoinById(String selectedCoin) async {
    return await _getCrypto(() => _getRemoteDataCoinById(selectedCoin), selectedCoin, 'getCoinById');
  }

  @override
  Future<Either<Failure, List<CoinsList>>> getCoinsList() async {
    return await _getCrypto(() => _getRemoteDataListCoins(), '', 'getCoinsList') as Either<Failure, List<CoinsList>>;
  }

  Future<Either<Failure, List<dynamic>>> _getCrypto(
      _CryptoResultsRemoteChooser _cryptoResultsRemoteChooser,
      String selectedCoin,
      String useCase
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCryptoRequest = await _cryptoResultsRemoteChooser();

        // getCoinsList/getCoinById To Cache
        switch(useCase) {
          case 'getCoinById': {
            cryptoLocalDataSource.cacheCoin(remoteCryptoRequest);
            break;
          }
          case 'getCoinsList': {
            cryptoLocalDataSource.cacheCoinsList(remoteCryptoRequest as List<CoinsList>);
            break;
          }
          default: {
            throw const ServerFailure();
          }
        }
        return Right(remoteCryptoRequest);

      } on ServerException {
        return const Left(
            ServerFailure()
        );
      }
    } else {
      try {

        // getCoinsList/getCoinById Get Last
        switch(useCase) {
          case 'getCoinById': {
            final localCryptoRequest = await cryptoLocalDataSource.getLastCoin(selectedCoin);
            return Right(localCryptoRequest);
          }
          case 'getCoinsList': {
            final localCryptoRequest = await cryptoLocalDataSource.getLastCoinsList();
            return Right(localCryptoRequest);
          }
          default: {
            throw CacheFailure();
          }
        }

      } on CacheException {
        return Left(
            CacheFailure()
        );
      }
    }
  }

  Future<List<dynamic>> _getRemoteDataCoinById(String selectedCoin) async {
    return await cryptoRemoteDataSource.getCoinById(
        selectedCoin,
        const CoinRequest(
            localization: 'false',
            tickers: false,
            marketData: false,
            communityData: true,
            developerData: false,
            sparkline: false
        )
    ).then(
        (value) => value.toEntities()
    );
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