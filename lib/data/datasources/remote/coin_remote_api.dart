import 'dart:io';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/data/models/request/coin_request.dart';
import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:dio/dio.dart';

class CoinRemoteApi {

  static const String coinUrl = 'http://api.coingecko.com/api/v3/coins/';

  Future<CoinResponse> getCoinById(String selectedCoin, CoinRequest request) async {
    try {
      final response = await Dio().get(coinUrl + selectedCoin, queryParameters: request.toMap());
      if (response.statusCode == 200) {
        if (response.data.isNotEmpty) {
          return CoinResponse.fromJson(response.data);
        }
      }
      return CoinResponse.fromJson({});
    } on DioError catch (error) {
      print(error);
      throw Failure(message: error.response?.statusMessage ?? 'Something went wrong.');
    } on SocketException catch (error) {
      print(error);
      throw Failure(message: 'Please check your connection.');
    }
  }
}