import 'package:crypto_tracker_app/core/usecases/usecase.dart';
import 'package:crypto_tracker_app/data/datasources/remote/coin_list_remote_api.dart';
import 'package:crypto_tracker_app/data/repositories/coins_list_repository_impl.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:crypto_tracker_app/domain/usecases/get_coins_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'app_provider.dart';

final coinListRemoteApiProvider = Provider<CoinListRemoteApi>((ref) => CoinListRemoteApi());

final coinsListRepositoryProvider = Provider<CoinsListRepository>((ref) => CoinsListRepositoryImpl(
    ref.read(coinListRemoteApiProvider),
    ref.read(objectBoxDatabaseProvider)
));

final getCoinsListProvider = Provider<UseCase>((ref) => GetCoinsList(
    ref.read(coinsListRepositoryProvider)
));

final coinsListViewModelProvider = FutureProvider.autoDispose<Either<FailureR, List<CoinsList>>>((ref) async {
  return await ref.read(getCoinsListProvider).call(NoParams()) as Either<FailureR, List<CoinsList>>;
});