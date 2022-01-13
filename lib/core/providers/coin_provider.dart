import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/usecases/usecase.dart';
import 'package:crypto_tracker_app/data/datasources/remote/coin_remote_api.dart';
import 'package:crypto_tracker_app/data/repositories/coin_repository_impl.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:crypto_tracker_app/domain/usecases/get_coin_by_id.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/core/providers/app_provider.dart';

final remoteCoinApiProvider = Provider<CoinRemoteApi>((ref) => CoinRemoteApi());

final coinRepositoryProvider = Provider<CoinRepository>((ref) => CoinRepositoryImpl(
    ref.read(remoteCoinApiProvider),
    ref.read(objectBoxDatabaseProvider)
));

final getCoinByIdProvider = Provider<UseCase>((ref) => GetCoinById(
    ref.read(coinRepositoryProvider)
));

final coinViewModelProvider = FutureProvider.autoDispose.family<Either<FailureR, List>, String>((ref, selectedCoin) async {
  return await ref.read(getCoinByIdProvider).call(Params(selectedCoin: selectedCoin)) as Either<FailureR, List>;
});