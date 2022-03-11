import 'dart:convert';

import 'package:crypto_tracker_app/data/models/coin_properties_model/community_data_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/description_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/developer_data_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/image_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/links_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/platforms_response.dart';
import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:crypto_tracker_app/domain/entities/platforms.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  late CoinResponse tCoinResponse;

  setUp(() {
    tCoinResponse = CoinResponse(
        coinId: "bitcoin",
        symbol: "BTC",
        name: "bitcoin",
        platforms: PlatformsResponse.fromJson(
            json.decode(getCoinByIdFixture('platforms_response.json'))
        ),
        blockTimeInMinutes: 60,
        algorithm: 'SHA-256',
        categories: const [
          'cryptocurrency',
          'staking'
        ],
        description: DescriptionResponse.fromJson(
            json.decode(getCoinByIdFixture('description_response.json'))
        ),
        links: LinksResponse.fromJson(
            json.decode(getCoinByIdFixture('links_response.json'))
        ),
        image: ImageResponse.fromJson(
            json.decode(getCoinByIdFixture('image_response.json'))
        ),
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
        developerData: DeveloperDataResponse.fromJson(
            json.decode(getCoinByIdFixture('developer_data_response.json'))
        ),
        communityData: CommunityDataResponse.fromJson(
            json.decode(getCoinByIdFixture('community_data_response.json'))
        ),
        lastUpdated: DateTime(2021)
    );
  });

  test('should be a data model for the coin entity', () async {
      // assert
      expect(tCoinResponse, isA<CoinResponse>());
    },
  );

  group('fromJson', () {
    // TODO: Modifier last4WeeksCommitActivitySeries pour List<int> puis dynamic
    // TODO: Modifier publicInterestScore pour int plutôt que double
    test('should return a valid template of JSON data', () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
            getCoinByIdFixture('entities_by_coin.json')
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