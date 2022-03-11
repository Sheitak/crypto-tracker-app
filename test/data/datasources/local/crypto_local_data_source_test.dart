import 'dart:convert';
import 'package:crypto_tracker_app/core/error/exception.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source_impl.dart';
import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';
import 'package:crypto_tracker_app/objectbox.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'crypto_local_data_source_test.mocks.dart';
import '../../../fixtures/fixture_reader.dart';

@GenerateMocks([ObjectBoxDatabase])
void main() {
  late CryptoLocalDataSourceImpl cryptoLocalDataSourceImpl;
  late MockObjectBoxDatabase mockObjectBoxDatabase;
  late String selectedCoin;
  late List<dynamic> tEntities;
  late List<CoinsList> tCoinsList;

  setUp(() {
    mockObjectBoxDatabase = MockObjectBoxDatabase();
    cryptoLocalDataSourceImpl = CryptoLocalDataSourceImpl(
        objectBoxDatabase: mockObjectBoxDatabase
    );
    selectedCoin = 'bitcoin';
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
          lastUpdated: DateTime(2021)
      ),
      Image(
          thumb: 'https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579',
          small: 'https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579',
          large: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579'
      )
    ];
    tCoinsList = [
         CoinsList(coinId: 'bitcoin', name: 'bitcoin', symbol: 'BTC'),
         CoinsList(coinId: 'ethereum', name: 'ethereum', symbol: 'ETH')
    ];
    // box = mockObjectBoxDatabase..store.box<CoinsList>();
  });

  // Coin
  group('getLastCoin', () {
    test('should return EntitiesList per Coin from ObjectBox when there is one in the cache', () async {
        // arrange
        final objectBox = mockObjectBoxDatabase.store.box();
        // final coin = (objectBox.query(Coin_.coinId.equals(selectedCoin))).build().findFirst();
        // final list = [];

        when(
            (objectBox.query(Coin_.coinId.equals(selectedCoin))).build().findFirst()
        ).thenReturn(tEntities);

        // act
        final result = await cryptoLocalDataSourceImpl.getLastCoin(selectedCoin);

        // assert
        // verify(mockObjectBoxDatabase.getString('CACHED_NUMBER_TRIVIA'));
        // verify(() => mockObjectBoxDatabase.query(Entity_.id.equals(id))).called(1);
        expect(result, equals(tEntities));
      },
    );

    test('should throw a CacheException when there is not a cached value', () {
      // arrange
      // when(mockObjectBoxDatabase.getString(any)).thenReturn(null);

      // act : Not calling the method here, just storing it inside a call variable
      final call = cryptoLocalDataSourceImpl.getLastCoin(selectedCoin);

      // assert
      // Calling the method happens from a higher-order function passed.
      // This is needed to test if calling a method throws an exception.
      expect(() => call, throwsA(
          const TypeMatcher<CacheException>()
      ));
    });
  });

  group('cacheCoin', () {
    test('should call ObjectBox to cache the data', () {
      // act
      cryptoLocalDataSourceImpl.cacheCoin(tEntities);
      // assert
      // verify(
      //   boxCoin.put(tEntities[0])
      // );
    });
  });

  // CoinsList
  group('getLastCoinsList', () {
    test('should return List of CoinsList from ObjectBox when there is one in the cache', () async {
      // arrange
      when(mockObjectBoxDatabase.store.box().getAll())
          .thenReturn(tCoinsList);

      // act
      final result = await cryptoLocalDataSourceImpl.getLastCoinsList();

      // assert
      // verify(mockObjectBoxDatabase.getString('CACHED_NUMBER_TRIVIA'));
      expect(result, equals(tCoinsList));
    });

    test('should throw a CacheException when there is not a cached value', () {
      // arrange
      // when(mockObjectBoxDatabase.getString(any)).thenReturn(null);
      when(mockObjectBoxDatabase.store.box().getAll())
          .thenReturn(tCoinsList);

      // act : Not calling the method here, just storing it inside a call variable
      final call = cryptoLocalDataSourceImpl.getLastCoinsList();

      // assert
      // Calling the method happens from a higher-order function passed.
      // This is needed to test if calling a method throws an exception.
      expect(() => call, throwsA(
          const TypeMatcher<CacheException>()
      ));
    });
  });

  group('cacheCoinsList', () {
    test('should call ObjectBox to cache the data', () {
      // act
      cryptoLocalDataSourceImpl.cacheCoinsList(tCoinsList);
      // assert
      // final expectedJsonString = json.encode(tCoinResponseModel.toJson());
      // verify(
      //     boxCoinsList.put(tCoinsList[0])
      // );
    });
  });
}