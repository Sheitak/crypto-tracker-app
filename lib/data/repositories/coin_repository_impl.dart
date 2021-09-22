import 'package:crypto_tracker_app/data/datasources/remote/coin_remote_api.dart';
import 'package:crypto_tracker_app/data/models/request/coin_request.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';

class CoinRepositoryImpl extends CoinRepository {

  final CoinRemoteApi _remoteApi;

  CoinRepositoryImpl(this._remoteApi);

  @override
  Future<Coin> getCoinById(String selectedCoin) {
    return _remoteApi
      .getCoinById(
        selectedCoin,
        const CoinRequest(
            localization: 'false',
            tickers: false,
            marketData: false,
            communityData: true,
            developerData: false,
            sparkline: false
        )
      )
      .then(
          (value) => value.toEntity()
      );
  }
}