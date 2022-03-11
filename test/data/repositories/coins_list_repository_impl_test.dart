import 'package:crypto_tracker_app/core/error/exception.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/network/network_info.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart';
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';
import 'package:crypto_tracker_app/data/models/response/coin_response.dart';
import 'package:crypto_tracker_app/data/models/response/coins_list_response.dart';
import 'package:crypto_tracker_app/data/repositories/coins_list_repository_impl.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'coins_list_repository_impl_test.mocks.dart';

@GenerateMocks([CryptoRemoteDataSource, CryptoLocalDataSource, CryptoRequest, NetworkInfo])
void main() {
  late CoinsListRepositoryImpl coinsListRepositoryImpl;
  late MockCryptoRemoteDataSource mockCryptoRemoteDataSource;
  late MockCryptoLocalDataSource mockCryptoLocalDataSource;
  late MockCryptoRequest mockCryptoRequest;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockCryptoRemoteDataSource = MockCryptoRemoteDataSource();
    mockCryptoLocalDataSource = MockCryptoLocalDataSource();
    mockCryptoRequest = MockCryptoRequest();
    mockNetworkInfo = MockNetworkInfo();

    coinsListRepositoryImpl = CoinsListRepositoryImpl(
        cryptoRemoteDataSource: mockCryptoRemoteDataSource,
        cryptoLocalDataSource: mockCryptoLocalDataSource,
        cryptoRequest: mockCryptoRequest,
        networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((_) async => true
        );
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((_) async => false
        );
      });
      body();
    });
  }

  // group('getConcreteNumberTrivia', () {
  //   // final tNumber = 1;
  //   // final tNumberTriviaModel = NumberTriviaModel(number: tNumber, text: 'test trivia');
  //   // final NumberTrivia tNumberTrivia = tNumberTriviaModel;
  //
  //   const tSelectedCoin = 'bitcoin';
  //   final tCoinResponse = CoinResponse(
  //       coinId: 'bitcoin',
  //       symbol: 'btc',
  //       name: 'bitcoin',
  //       blockTimeInMinutes: 60,
  //       algorithm: 'SHA-256',
  //       categories: const [
  //         'cryptocurrency',
  //         'staking'
  //       ],
  //       genesisDate: '2009-01-03',
  //       sentimentVotesUpPercentage: 74.47,
  //       sentimentVotesDownPercentage: 25.53,
  //       marketCapRank: 1,
  //       coinGeckoRank: 2,
  //       coinGeckoScore: 80.265,
  //       developerScore: 98.849,
  //       communityScore: 70.638,
  //       liquidityScore: 100.062,
  //       publicInterestScore: 0,
  //       lastUpdated: DateTime(2021),
  //       platforms: null,
  //       description: null,
  //       links: null,
  //       developerData: null,
  //       image: null,
  //       communityData: null
  //   );
  //   final tEntities = [
  //     Coin(
  //         coinId: 'bitcoin',
  //         symbol: 'btc',
  //         name: 'bitcoin',
  //         blockTimeInMinutes: 60,
  //         algorithm: 'SHA-256',
  //         categories: const [
  //           'cryptocurrency',
  //           'staking'
  //         ],
  //         genesisDate: '2009-01-03',
  //         sentimentVotesUpPercentage: 74.47,
  //         sentimentVotesDownPercentage: 25.53,
  //         marketCapRank: 1,
  //         coinGeckoRank: 2,
  //         coinGeckoScore: 80.265,
  //         developerScore: 98.849,
  //         communityScore: 70.638,
  //         liquidityScore: 100.062,
  //         publicInterestScore: 0,
  //         lastUpdated: DateTime(2021)
  //     ),
  //     Image(
  //         thumb: 'https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579',
  //         small: 'https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579',
  //         large: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579'
  //     )
  //   ];
  //
  //   test('should check if the device is online', () async {
  //       // arrange
  //       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  //       // act
  //       repository.getConcreteNumberTrivia(tNumber);
  //       // assert
  //       verify(mockNetworkInfo.isConnected);
  //     },
  //   );
  //
  //   runTestsOnline(() {
  //     test(
  //       'should return remote data when the call to remote data source is successful',
  //           () async {
  //         // arrange
  //         // when(mockRemoteDataSource.getConcreteNumberTrivia(any))
  //         //     .thenAnswer((_) async => tNumberTriviaModel);
  //         // // act
  //         // final result = await repository.getConcreteNumberTrivia(tNumber);
  //         // // assert
  //         // verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
  //         // expect(result, equals(Right(tNumberTrivia)));
  //       },
  //     );
  //
  //     test(
  //       'should cache the data locally when the call to remote data source is successful',
  //           () async {
  //         // arrange
  //         // when(mockRemoteDataSource.getConcreteNumberTrivia(any))
  //         //     .thenAnswer((_) async => tNumberTriviaModel);
  //         // // act
  //         // await repository.getConcreteNumberTrivia(tNumber);
  //         // // assert
  //         // verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
  //         // verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
  //       },
  //     );
  //
  //     test(
  //       'should return server failure when the call to remote data source is unsuccessful',
  //           () async {
  //         // arrange
  //         // when(mockRemoteDataSource.getConcreteNumberTrivia(any))
  //         //     .thenThrow(ServerException());
  //         // // act
  //         // final result = await repository.getConcreteNumberTrivia(tNumber);
  //         // // assert
  //         // verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
  //         // verifyZeroInteractions(mockLocalDataSource);
  //         // expect(result, equals(Left(ServerFailure())));
  //       },
  //     );
  //   });
  //
  //   runTestsOffline(() {
  //     test(
  //       'should return last locally cached data when the cached data is present',
  //           () async {
  //         // arrange
  //         // when(mockLocalDataSource.getLastNumberTrivia())
  //         //     .thenAnswer((_) async => tNumberTriviaModel);
  //         // // act
  //         // final result = await repository.getConcreteNumberTrivia(tNumber);
  //         // // assert
  //         // verifyZeroInteractions(mockRemoteDataSource);
  //         // verify(mockLocalDataSource.getLastNumberTrivia());
  //         // expect(result, equals(Right(tNumberTrivia)));
  //       },
  //     );
  //
  //     test(
  //       'should return CacheFailure when there is no cached data present',
  //           () async {
  //         // arrange
  //         // when(mockLocalDataSource.getLastNumberTrivia())
  //         //     .thenThrow(CacheException());
  //         // // act
  //         // final result = await repository.getConcreteNumberTrivia(tNumber);
  //         // // assert
  //         // verifyZeroInteractions(mockRemoteDataSource);
  //         // verify(mockLocalDataSource.getLastNumberTrivia());
  //         // expect(result, equals(Left(CacheFailure())));
  //       },
  //     );
  //   });
  // });

  group('getCoinsList', () {
    // final tNumberTriviaModel = NumberTriviaModel(number: 123, text: 'test trivia');
    // final NumberTrivia tNumberTrivia = tNumberTriviaModel;
    final tCoinsListRequest = CoinsListRequest(
        includePlatform: false
    );
    final tCoinsListResponse = [
      const CoinsListResponse(id: 'bitcoin', name: 'bitcoin', symbol: 'BTC'),
      const CoinsListResponse(id: 'ethereum', name: 'ethereum', symbol: 'ETH')
    ];
    final yu = [
      const CoinsListResponse(id: 'bitcoin', name: 'bitcoin', symbol: 'BTC').toEntity(),
      const CoinsListResponse(id: 'ethereum', name: 'ethereum', symbol: 'ETH').toEntity()
    ].toList();
    final List<CoinsList> tCoinsList = yu;

    test('should check if the device is online', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer(
                (_) async => true
        );
        // act
        await coinsListRepositoryImpl.getCoinsList();
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test('should return remote data when the call to remote data source is successful', () async {
          // arrange
          when(mockCryptoRemoteDataSource.getCoinsList(tCoinsListRequest))
              .thenAnswer((_) async => tCoinsListResponse
          );
          // act
          final result = await coinsListRepositoryImpl.getCoinsList();
          // assert
          verify(mockCryptoRemoteDataSource.getCoinsList(tCoinsListRequest));
          expect(result, equals(
              Right(tCoinsList)
            )
          );
        },
      );

      test('should cache the data locally when the call to remote data source is successful', () async {
          // arrange
          when(mockCryptoRemoteDataSource.getCoinsList(tCoinsListRequest))
              .thenAnswer((_) async => tCoinsListResponse
          );
          // act
          await coinsListRepositoryImpl.getCoinsList();
          // assert
          verify(mockCryptoRemoteDataSource.getCoinsList(tCoinsListRequest));
          verify(mockCryptoLocalDataSource.cacheCoinsList(yu));
        },
      );

      test('should return server failure when the call to remote data source is unsuccessful', () async {
          // arrange
          when(mockCryptoRemoteDataSource.getCoinsList(tCoinsListRequest))
              .thenThrow(ServerException()
          );
          // act
          final result = await coinsListRepositoryImpl.getCoinsList();
          // assert
          verify(mockCryptoRemoteDataSource.getCoinsList(tCoinsListRequest));
          verifyZeroInteractions(mockCryptoLocalDataSource);
          expect(result, equals(
              const Left(
                  ServerFailure()
              )
          ));
        },
      );
    });

    runTestsOffline(() {
      test('should return last locally cached data when the cached data is present', () async {
          // arrange
          when(mockCryptoLocalDataSource.getLastCoinsList())
              .thenAnswer((_) async => yu);
          // act
          final result = await coinsListRepositoryImpl.getCoinsList();
          // assert
          verifyZeroInteractions(mockCryptoRemoteDataSource);
          verify(mockCryptoLocalDataSource.getLastCoinsList());
          expect(result, equals(
              Right(tCoinsList)
          ));
        },
      );

      test('should return CacheFailure when there is no cached data present', () async {
          // arrange
          when(mockCryptoLocalDataSource.getLastCoinsList())
              .thenThrow(CacheException()
          );
          // act
          final result = await coinsListRepositoryImpl.getCoinsList();
          // assert
          verifyZeroInteractions(mockCryptoRemoteDataSource);
          verify(mockCryptoLocalDataSource.getLastCoinsList());
          expect(result, equals(
              const Left(CacheFailure()
              ))
          );
        },
      );
    });
  });
}