import 'dart:io';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';
import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:crypto_tracker_app/data/models/response/coins_list_response.dart';
import 'package:dio/dio.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';

class CryptoRemoteDataSourceImpl extends CryptoRemoteDataSource {

  static const String coinsListUrl = 'http://api.coingecko.com/api/v3/coins/list';
  static const String coinUrl = 'http://api.coingecko.com/api/v3/coins/';

  @override
  Future<List<CoinsListResponse>> getCoinsList(CryptoRequest request) async {
    try {
      final response = await Dio().get(coinsListUrl, queryParameters: request.toMap());
      if (response.statusCode == 200) {
        // final data = Map<String, dynamic>.from(response.data);
        final data = List<Map<String, dynamic>>.from(response.data);
        if (data.isNotEmpty) {
          return data.map(
              (element) => CoinsListResponse.fromJson(element)
          ).toList();
        }
      }
      return [];
    } on DioError catch (error) {
      throw StandardFailure(
          message: error.response?.statusMessage ?? 'Failure : Something went wrong.',
          code: 400
      );
    } on SocketException {
      throw const ServerFailure();
    }
  }

  @override
  Future<CoinResponse> getCoinById(String selectedCoin, CryptoRequest request) async {
    try {
      final response = await Dio().get(coinUrl + selectedCoin, queryParameters: request.toMap());
      if (response.statusCode == 200) {
        if (response.data.isNotEmpty) {
          return CoinResponse.fromJson(response.data);
        }
      }
      return CoinResponse.fromJson(const {});
    } on DioError catch (error) {
      throw StandardFailure(
          message: error.response?.statusMessage ?? 'Failure : Something went wrong.',
          code: 400
      );
    } on SocketException {
      throw const ServerFailure();
    }
  }





  // TODO : Refactorisation en cours
  // @override
  // Future<List<CoinsListResponse>> getCoinsList(CoinsListRequest request) =>
  //     _getCoinOrCoinsList(coinsListUrl, request) as Future<List<CoinsListResponse>>;
  //
  // @override
  // Future<CoinResponse> getCoinById(String selectedCoin, CoinRequest request) =>
  //     _getCoinOrCoinsList(coinUrl + selectedCoin, request) as Future<CoinResponse>;

  // Future<dynamic> _getCoinOrCoinsList(String url, dynamic request) async {
  //   try {
  //     final response = await Dio().get(url, queryParameters: request.toMap());
  //     if (response.statusCode == 200) {
  //
  //       // getCoinById Request
  //       if (request.runtimeType == CoinRequest) {
  //         if (response.data.isNotEmpty) {
  //           return CoinResponse.fromJson(response.data);
  //         } else {
  //           return CoinResponse.fromJson(const {});
  //         }
  //       }
  //
  //       // getCoinsList Request
  //       if (request.runtimeType == CoinsListRequest) {
  //         final data = List<Map<String, dynamic>>.from(response.data);
  //         if (data.isNotEmpty) {
  //           return data.map(
  //                 (element) => CoinsListResponse.fromJson(element)
  //           ).toList();
  //         } else {
  //           return [];
  //         }
  //       }
  //
  //        return throw const StandardFailure(
  //            message: 'Failure : No supported request type.',
  //            code: 400
  //        );
  //     }
  //   } on DioError catch (error) {
  //     throw StandardFailure(
  //         message: error.response?.statusMessage ?? 'Failure : Something went wrong.',
  //         code: 400
  //     );
  //   } on SocketException catch (error) {
  //     // throw const Failure(message: 'Please check your connection.');
  //     throw ServerFailure();
  //   }
  // }
}