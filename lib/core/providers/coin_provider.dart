import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/usecases/usecase.dart';
import 'package:crypto_tracker_app/data/repositories/coin_repository_impl.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:crypto_tracker_app/domain/usecases/get_coin_by_id.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/core/providers/app_provider.dart';
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';
import 'package:crypto_tracker_app/data/models/request/coin_request.dart';

final cryptoRequestProvider = Provider<CryptoRequest>((ref) => CoinRequest(
    localization: 'false',
    tickers: false,
    marketData: false,
    communityData: true,
    developerData: true,
    sparkline: false
));

final coinRepositoryProvider = Provider<CoinRepository>((ref) => CoinRepositoryImpl(
    cryptoRemoteDataSource: ref.read(cryptoRemoteDataSourceProvider),
    cryptoLocalDataSource: ref.read(cryptoLocalDataSourceProvider),
    cryptoRequest: ref.read(cryptoRequestProvider),
    networkInfo: ref.read(networkInfoProvider)
));

final getCoinByIdProvider = Provider<UseCase>((ref) => GetCoinById(
    coinRepository: ref.read(coinRepositoryProvider)
    // cryptoRepository: ref.read(cryptoRepositoryProvider)
));

final coinViewModelProvider = FutureProvider.autoDispose.family<Either<Failure, List>, String>((ref, selectedCoin) async {
  return await ref.read(getCoinByIdProvider).call(Params(selectedCoin: selectedCoin)) as Either<Failure, List>;
});