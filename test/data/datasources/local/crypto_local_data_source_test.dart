import 'dart:convert';
import 'package:crypto_tracker_app/core/error/exception.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source_impl.dart';
import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../fixtures/fixture_reader.dart';
import 'crypto_local_data_source_test.mocks.dart';

@GenerateMocks([ObjectBoxDatabase])
void main() {
  late CryptoLocalDataSourceImpl cryptoLocalDataSourceImpl;
  late MockObjectBoxDatabase mockObjectBoxDatabase;
  // MockSharedPreferences mockSharedPreferences;
  late String selectedCoin;

  setUp(() {
    mockObjectBoxDatabase = MockObjectBoxDatabase();
    cryptoLocalDataSourceImpl = CryptoLocalDataSourceImpl(
        objectBoxDatabase: mockObjectBoxDatabase
    );
    selectedCoin = 'bitcoin';
  });

  // Coin
  group('getLastCoin', () {
    final tCoinResponseModel = [];
    // final tCoinResponseModel = CoinResponse.fromJson(
    //     json.decode(fixture('coin_response_cached.json'))
    // );

    test('should return CoinResponse from ObjectBox when there is one in the cache', () async {
        // arrange
        // when(mockObjectBoxDatabase.getString(any))
        //     .thenReturn(fixture('crypto_cached.json'));

        // act
        final result = await cryptoLocalDataSourceImpl.getLastCoin(selectedCoin);

        // assert
        // verify(mockObjectBoxDatabase.getString('CACHED_NUMBER_TRIVIA'));
        expect(result, equals(tCoinResponseModel));
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
    final tCoinResponseModel = [];
    // final tNumberTrivia = NumberTriviaModel(number: 1, text: 'test trivia');

    test('should call ObjectBox to cache the data', () {
      // act
      cryptoLocalDataSourceImpl.cacheCoin(tCoinResponseModel);

      // assert
      // final expectedJsonString = json.encode(tCoinResponseModel.toJson());
      // verify(mockObjectBoxDatabase.setString(
      //   CACHED_NUMBER_TRIVIA,
      //   expectedJsonString,
      // ));
    });
  });

  // CoinsList
  group('getLastCoinsList', () {
    final tCoinResponseModel = [];
    // final tCoinResponseModel = CoinResponse.fromJson(
    //     json.decode(fixture('coin_response_cached.json'))
    // );

    test('should return CoinResponse from ObjectBox when there is one in the cache', () async {
      // arrange
      // when(mockObjectBoxDatabase.getString(any))
      //     .thenReturn(fixture('crypto_cached.json'));

      // act
      final result = await cryptoLocalDataSourceImpl.getLastCoin(selectedCoin);

      // assert
      // verify(mockObjectBoxDatabase.getString('CACHED_NUMBER_TRIVIA'));
      expect(result, equals(tCoinResponseModel));
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

  group('cacheCoinsList', () {
    final tCoinResponseModel = [];
    // final tNumberTrivia = NumberTriviaModel(number: 1, text: 'test trivia');

    test('should call ObjectBox to cache the data', () {
      // act
      cryptoLocalDataSourceImpl.cacheCoin(tCoinResponseModel);

      // assert
      // final expectedJsonString = json.encode(tCoinResponseModel.toJson());
      // verify(mockObjectBoxDatabase.setString(
      //   CACHED_NUMBER_TRIVIA,
      //   expectedJsonString,
      // ));
    });
  });
}