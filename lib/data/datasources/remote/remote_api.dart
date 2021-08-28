import 'dart:io';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/data/models/response/coins_list_response.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final remoteApiProvider = Provider<RemoteApi>((ref) => RemoteApi());

class RemoteApi {

  static const String coinsListUrl = 'http://api.coingecko.com/api/v3/coins/list';

  Future<List<CoinsListResponse>> getCoinsList(CoinsListRequest request) async {
    try {
      final response = await Dio().get(coinsListUrl, queryParameters: request.toMap());
      if (response.statusCode == 200) {
        // final data = Map<String, dynamic>.from(response.data);
        final data = List<Map<String, dynamic>>.from(response.data);
        if (data.isNotEmpty) {
          return data.map((element) => CoinsListResponse.fromMap(element)).toList();
        }
      }
      return [];
    } on DioError catch (error) {
      print(error);
      throw Failure(message: error.response?.statusMessage ?? 'Something went wrong.');
    } on SocketException catch (error) {
      print(error);
      throw Failure(message: 'Please check your connection.');
    }
  }
}