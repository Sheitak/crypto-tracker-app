import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/data/datasources/remote/coin_list_remote_api.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';

class CoinsListRepositoryImpl extends CoinsListRepository {

  final CoinListRemoteApi _coinListRemoteApi;
  final ObjectBoxDatabase _objectBoxDatabase;
  
  CoinsListRepositoryImpl(
      this._coinListRemoteApi,
      this._objectBoxDatabase
  );

  @override
  Future<List<CoinsList>> getCoinsList() async {

    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    final _boxListCoins = _objectBoxDatabase.store.box<CoinsList>();

    if (connectivityResult != ConnectivityResult.none) {
      final remoteCoinsList = await getRemoteDataListCoins();

      for (var coin in remoteCoinsList) {
        _boxListCoins.put(coin);
      }
    }
    List<CoinsList> coinsList = _boxListCoins.getAll();

    return coinsList;
  }

  Future<List<CoinsList>> getRemoteDataListCoins() async {
    return _coinListRemoteApi
        .getCoinsList(
        const CoinsListRequest(includePlatform: false)
    ).then(
      (value) => value.map(
              (element) => element.toEntity()
      ).toList()
    );
  }
}