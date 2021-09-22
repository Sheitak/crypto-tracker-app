import 'package:crypto_tracker_app/data/datasources/remote/coin_list_remote_api.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';

class CoinsListRepositoryImpl extends CoinsListRepository {

  final CoinListRemoteApi _coinListRemoteApi;
  
  CoinsListRepositoryImpl(this._coinListRemoteApi);

  @override
  Future<List<CoinsList>> getCoinsList() {
    return _coinListRemoteApi
      .getCoinsList(
        const CoinsListRequest(
            includePlatform: false
        )
      )
      .then(
          (value) => value.map((element) => element.toEntity()).toList()
      );
  }
}