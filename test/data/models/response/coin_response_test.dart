import 'dart:convert';

import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import '../../../fixtures/fixture_reader.dart';

@GenerateMocks([CoinResponse])
void main() {
  late CoinResponse tCoinResponse;
  // https://www.youtube.com/watch?v=keaTZ9M_U1A&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech&index=5

  setUp(() {
    // tCoinResponse = json.decode(getCoinByIdFixture('coin_response.json'));

    // tCoinResponse = CoinResponse(
    //     coinId: 'bitcoin',
    //     symbol: 'btc',
    //     name: 'bitcoin',
    //     blockTimeInMinutes: 60,
    //     algorithm: 'SHA-256',
    //     categories: const [
    //       'cryptocurrency',
    //       'staking'
    //     ],
    //     genesisDate: '2009-01-03',
    //     sentimentVotesUpPercentage: 74.47,
    //     sentimentVotesDownPercentage: 25.53,
    //     marketCapRank: 1,
    //     coinGeckoRank: 2,
    //     coinGeckoScore: 80.265,
    //     developerScore: 98.849,
    //     communityScore: 70.638,
    //     liquidityScore: 100.062,
    //     publicInterestScore: 0,
    //     lastUpdated: DateTime(2021)
    // );

    tCoinResponse = CoinResponse(
        coinId: "bitcoin",
        symbol: "BTC",
        name: "bitcoin",
        platforms: json.decode(getCoinByIdFixture('platforms_response.json')),
        blockTimeInMinutes: 60,
        algorithm: 'SHA-256',
        categories: const [
          'cryptocurrency',
          'staking'
        ],
        description: json.decode(getCoinByIdFixture('description_response.json')),
        links: json.decode(getCoinByIdFixture('links_response.json')),
        image: json.decode(getCoinByIdFixture('image_response.json')),
        genesisDate: '2009-01-03',
        sentimentVotesUpPercentage: 74.47,
        sentimentVotesDownPercentage: 25.53,
        marketCapRank: 1,
        coinGeckoRank: 2,
        coinGeckoScore: 80.265,
        developerScore: 98.849,
        communityScore: 70.638,
        liquidityScore: 100.062,
        publicInterestScore: 0,
        developerData: json.decode(getCoinByIdFixture('coin_response.json')),
        communityData: json.decode(getCoinByIdFixture('coin_response.json')),
        lastUpdated: DateTime(2021)
    );
  });

  test('should be a data model for the coin entity', () async {
      // assert
      expect(tCoinResponse, isA<CoinResponse>());
    },
  );

  group('fromJson', () {
    test('should return a valid template of JSON data', () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
            getCoinByIdFixture('coin_response.json')
        );
        // act
        final result = CoinResponse.fromJson(jsonMap);
        // assert
        expect(result, tCoinResponse);
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