import 'dart:convert';

import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:crypto_tracker_app/data/models/response/coins_list_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  late CoinsListResponse tCoinsListResponse;

  setUp(() {
    // tCoinsListResponse = json.decode(
    //     getCoinsListFixture('coins_list_response.json')
    // );

    tCoinsListResponse = const CoinsListResponse(
        id: 'bitcoin', name: 'bitcoin', symbol: 'BTC'
    );
  });

  test('should be a data model for the coin entity', () async {
    // assert
    expect(tCoinsListResponse, isA<CoinsListResponse>());
  },
  );

  group('fromJson', () {
    test('should return a valid template of JSON data', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(
          getCoinsListFixture('coins_list_response.json')
      );
      // act
      final result = CoinsListResponse.fromJson(jsonMap);
      // assert
      expect(result, tCoinsListResponse);
    },
    );
  });

  // group('toJson', () {
  //   test('should return a JSON map containing the proper data', () async {
  //       // act
  //       final result = tCoinResponse.toJson();
  //       // assert
  //       final expectedJsonMap = {};
  //       expect(result, expectedJsonMap);
  //     },
  //   );
  // });
}