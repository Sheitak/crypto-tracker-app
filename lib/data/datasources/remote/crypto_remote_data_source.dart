import 'package:crypto_tracker_app/data/models/request/coin_request.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:crypto_tracker_app/data/models/response/coins_list_response.dart';

abstract class CryptoRemoteDataSource {
  Future<List<CoinsListResponse>> getCoinsList(CoinsListRequest request);
  Future<CoinResponse> getCoinById(String selectedCoin, CoinRequest request);
}