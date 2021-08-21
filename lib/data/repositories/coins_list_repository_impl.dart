import 'package:crypto_tracker_app/data/datasources/remote/remote_api.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repositoy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final coinsListRepositoryProvider = Provider<CoinsListRepository>((ref) => CoinsListRepositoryImpl(ref.read(remoteApiProvider)));

class CoinsListRepositoryImpl extends CoinsListRepository {

  final RemoteApi _remoteApi;
  
  CoinsListRepositoryImpl(this._remoteApi);

  @override
  Future<List<CoinsList>> getCoinsList({required int numCoins}) {
    return _remoteApi
        .getCoinsList(CoinsListRequest(includePlatform: true))
        .then((value) => value.map((element) => element.toEntity()).toList());
  }
}