import 'package:crypto_tracker_app/core/usecases/usecase.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';
import 'package:crypto_tracker_app/data/repositories/coins_list_repository_impl.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:crypto_tracker_app/domain/usecases/get_coins_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/providers/app_provider.dart';
import 'package:dartz/dartz.dart';

final cryptoRequestProvider = Provider<CryptoRequest>((ref) => CoinsListRequest(
    includePlatform: false
));

final coinsListRepositoryProvider = Provider<CoinsListRepository>((ref) => CoinsListRepositoryImpl(
    cryptoRemoteDataSource: ref.read(cryptoRemoteDataSourceProvider),
    cryptoLocalDataSource: ref.read(cryptoLocalDataSourceProvider),
    cryptoRequest: ref.read(cryptoRequestProvider),
    networkInfo: ref.read(networkInfoProvider),
));

final getCoinsListProvider = Provider<UseCase>((ref) => GetCoinsList(
    // cryptoRepository: ref.read(cryptoRepositoryProvider)
    coinsListRepository: ref.read(coinsListRepositoryProvider)
));

final coinsListViewModelProvider = FutureProvider.autoDispose<Either<Failure, List<CoinsList>>>((ref) async {
  return await ref.read(getCoinsListProvider).call(NoParams()) as Either<Failure, List<CoinsList>>;
});