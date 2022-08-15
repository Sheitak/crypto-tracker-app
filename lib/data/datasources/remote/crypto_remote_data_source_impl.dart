import 'dart:convert';
import 'dart:io';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';
import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:crypto_tracker_app/data/models/response/coins_list_response.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';

class CryptoRemoteDataSourceImpl extends CryptoRemoteDataSource {

  static const String coinsListUrl = 'http://api.coingecko.com/api/v3/coins/list';
  static const String coinUrl = 'http://api.coingecko.com/api/v3/coins/';
  static const String postTicketUrl = 'https://10.0.2.2:8000/api/tickets';

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
          message: error.message,
          code: 500
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
          message: error.message,
          code: 500
      );
    } on SocketException {
      throw const ServerFailure();
    }
  }

  // Future<void> postTicket(parameters) async {
  //   // print(parameters);
  //   try {
  //     final response = await Dio().post(
  //       postTicketUrl,
  //       data: jsonEncode(parameters),
  //       options: Options(
  //         headers: {
  //           HttpHeaders.contentTypeHeader: "application/json",
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.data);
  //     }
  //   } on DioError catch (error) {
  //     throw ServerFailure(
  //         message: error.message,
  //         code: 500
  //     );
  //   }
  // }
}