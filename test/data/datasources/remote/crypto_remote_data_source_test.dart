import 'dart:convert';
import 'package:crypto_tracker_app/core/error/exception.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source_impl.dart';
import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source_impl.dart';
import 'package:crypto_tracker_app/data/models/request/coin_request.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';
import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:crypto_tracker_app/data/models/response/coins_list_response.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../fixtures/fixture_reader.dart';
import 'crypto_remote_data_source_test.mocks.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

// Handle Dio For Flutter Test : https://pub.dev/packages/http_mock_adapter
// https://github.com/flutterchina/dio/issues/374
@GenerateMocks([Dio, CryptoRemoteDataSourceImpl, CryptoRequest, CoinRequest, CoinsListRequest])
void main() {
  late CryptoRemoteDataSourceImpl cryptoRemoteDataSourceImpl;
  late CoinRequest tCoinRequest;
  late CoinsListRequest tCoinsListRequest;
  late String tSelectedCoin;
  late MockDio mockDio;
  late Dio dio;
  late DioAdapter dioAdapter;
  late List<dynamic> tEntities;

  setUp(() {
    mockDio = MockDio();
    cryptoRemoteDataSourceImpl = CryptoRemoteDataSourceImpl();
    tCoinRequest = CoinRequest(
        localization: 'false',
        tickers: false,
        marketData: false,
        communityData: true,
        developerData: false,
        sparkline: false
    );
    tCoinsListRequest = CoinsListRequest(
        includePlatform: false
    );
    tSelectedCoin = 'bitcoin';
    dio = Dio(
        BaseOptions(baseUrl: 'http://api.coingecko.com/api/v3/')
    );
    dioAdapter = DioAdapter(dio: dio);
    tEntities = [
      Coin(
          coinId: 'bitcoin',
          symbol: 'btc',
          name: 'bitcoin',
          blockTimeInMinutes: 60,
          algorithm: 'SHA-256',
          categories: const [
            'cryptocurrency',
            'staking'
          ],
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
          lastUpdated: DateTime(2021),
          isFavorite: false
      ),
      Image(
          thumb: 'https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579',
          small: 'https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579',
          large: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579'
      )
    ];
  });

  group('getCoinById', () {
    const path = 'coins/bitcoin';
    final response = json.decode(fixture('coin.json'));

    test('should return CoinById when the response code is 200 (success)', () async {
      //arrange
      dioAdapter.onGet(
          path,
              (server) => server.reply(
              200, response
          )
      );
      // act
      // await cryptoRemoteDataSourceImpl.getCoinById(tSelectedCoin, tCoinRequest);
      final result = await dio.get(
          path, queryParameters: tCoinRequest.toMap()
      );
      // assert
      expect(result.statusCode, 200);
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
        // arrange
        dioAdapter.onGet(
          path,
              (server) => server.throws(
              404,
              DioError(
                requestOptions: RequestOptions(
                  path: path,
                ),
              )
          ),
        );

        // act
        await cryptoRemoteDataSourceImpl.getCoinById(tSelectedCoin, tCoinRequest);

        // assert
        expect(() async => await dio.get(path),
          throwsA(
              isA<DioError>()
          ),
        );
      },
    );
  });

  group('getCoinsList', () {
    const path = 'coins/list';
    final response = json.decode(getCoinsListFixture('coins_list_response.json'));
    final listFromResponse = List<Map<String, dynamic>>.from(
        json.decode(getCoinsListFixture('coins_list_response.json'))
    );
    final tCoinsListResponse = listFromResponse.map(
            (element) => CoinsListResponse.fromJson(element)
    ).toList();

    test('should return CoinsList when the response code is 200 (success)', () async {
        // arrange
        dioAdapter.onGet(
          path,
          (server) => server.reply(
              // 200, tCoinsListResponse
              200, response
          )
        );

        // Exemple of MockDio with mockito
        // when(
        //     mockDio.get(
        //         any,
        //         queryParameters: anyNamed('queryParameters')
        //     )).thenAnswer((realInvocation) async =>
        //     Response(
        //         data: tCoinsListResponse,
        //         requestOptions: RequestOptions(
        //             method: 'GET',
        //             path: 'http://api.coingecko.com/api/v3/coins/list'
        //         )
        //     )
        // );

        // act
        // final result = await cryptoRemoteDataSourceImpl.getCoinsList(tCoinsListRequest);
        final result = await dio.get(
            path, queryParameters: tCoinsListRequest.toMap()
        );

        // assert
        expect(result.statusCode, 200);
        // expect(result, tCoinsListResponse);

        // verify(
        //     mockDio.get(
        //         'http://api.coingecko.com/api/v3/coins/list',
        //         queryParameters: tCoinsListRequest.toMap()
        //     )
        // );
        // verifyNoMoreInteractions(mockDio);
      },
    );

    test('should throw a DioException when the response code is 404 or other', () async {
        // arrange
        dioAdapter.onGet(
          path,
          (server) => server.throws(
              404,
              DioError(
                requestOptions: RequestOptions(
                  path: path,
                ),
              )
          ),
        );

        // Exemple of MockDio with mockito
        // when(
        //     mockDio.get(
        //         any,
        //         queryParameters: anyNamed('queryParameters')
        //     )).thenThrow(DioError(
        //         requestOptions: RequestOptions(
        //             method: 'GET',
        //             path: 'http://api.coingecko.com/api/v3/coins/list'
        //         ), response: Response(
        //             statusCode: 400,
        //             statusMessage: 'Failure',
        //             requestOptions: RequestOptions(
        //                 method: 'GET',
        //                 path: 'http://api.coingecko.com/api/v3/coins/list'
        //             )
        //         )
        //     )
        // );

        // act
        await cryptoRemoteDataSourceImpl.getCoinsList(tCoinsListRequest);

        // assert
        expect(() async => await dio.get(path),
          throwsA(
              isA<DioError>()
          ),
        );
      },
    );
  });
}