// import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
// import 'package:crypto_tracker_app/data/datasources/remote/coin_list_remote_api.dart';
// import 'package:crypto_tracker_app/data/repositories/coins_list_repository_impl.dart';
// import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
// import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
// import 'package:crypto_tracker_app/domain/usecases/coins_list_usecase.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final objectBoxDatabaseProvider = Provider<ObjectBoxDatabase>((ref) => throw UnimplementedError());

// final coinListRemoteApiProvider = Provider<CoinListRemoteApi>((ref) => CoinListRemoteApi());
//
// final coinsListRepositoryProvider = Provider<CoinsListRepository>((ref) => CoinsListRepositoryImpl(
//     ref.read(coinListRemoteApiProvider),
//     ref.read(objectBoxDatabaseProvider)
// ));
//
// final coinsListUseCaseProvider = Provider<CoinsListUseCase>((ref) => CoinsListUseCase(ref.read(coinsListRepositoryProvider)));
//
// final coinsListViewModelProvider = FutureProvider.autoDispose<List<CoinsList>>((ref) async {
//   return ref.read(coinsListUseCaseProvider).getCoinsList();
// });