import 'package:crypto_tracker_app/core/network/network_info.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:crypto_tracker_app/data/repositories/coin_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'coin_repository_impl_test.mocks.dart';

@GenerateMocks([CoinRepositoryImpl, CryptoRemoteDataSource, CryptoLocalDataSource, NetworkInfo])
void main() {
  MockCoinRepositoryImpl mockCoinRepositoryImpl;
  MockCryptoRemoteDataSource mockCryptoRemoteDataSource;
  MockCryptoLocalDataSource mockCryptoLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockCryptoRemoteDataSource = MockCryptoRemoteDataSource();
    mockCryptoLocalDataSource = MockCryptoLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    // mockCoinRepositoryImpl = CoinRepositoryImpl(
    //   cryptoRemoteDataSource: mockCryptoRemoteDataSource,
    //   cryptoLocalDataSource: mockCryptoLocalDataSource,
    //   // networkInfo: mockNetworkInfo
    // );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        // when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        // when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel =
    // NumberTriviaModel(number: tNumber, text: 'test trivia');
    // final NumberTrivia tNumberTrivia = tNumberTriviaModel;

    test(
      'should check if the device is online',
          () async {
        // arrange
        // when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // // act
        // repository.getConcreteNumberTrivia(tNumber);
        // // assert
        // verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
            () async {
          // arrange
          // when(mockRemoteDataSource.getConcreteNumberTrivia(any))
          //     .thenAnswer((_) async => tNumberTriviaModel);
          // // act
          // final result = await repository.getConcreteNumberTrivia(tNumber);
          // // assert
          // verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
          // expect(result, equals(Right(tNumberTrivia)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
            () async {
          // arrange
          // when(mockRemoteDataSource.getConcreteNumberTrivia(any))
          //     .thenAnswer((_) async => tNumberTriviaModel);
          // // act
          // await repository.getConcreteNumberTrivia(tNumber);
          // // assert
          // verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
          // verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          // when(mockRemoteDataSource.getConcreteNumberTrivia(any))
          //     .thenThrow(ServerException());
          // // act
          // final result = await repository.getConcreteNumberTrivia(tNumber);
          // // assert
          // verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
          // verifyZeroInteractions(mockLocalDataSource);
          // expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
            () async {
          // arrange
          // when(mockLocalDataSource.getLastNumberTrivia())
          //     .thenAnswer((_) async => tNumberTriviaModel);
          // // act
          // final result = await repository.getConcreteNumberTrivia(tNumber);
          // // assert
          // verifyZeroInteractions(mockRemoteDataSource);
          // verify(mockLocalDataSource.getLastNumberTrivia());
          // expect(result, equals(Right(tNumberTrivia)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
            () async {
          // arrange
          // when(mockLocalDataSource.getLastNumberTrivia())
          //     .thenThrow(CacheException());
          // // act
          // final result = await repository.getConcreteNumberTrivia(tNumber);
          // // assert
          // verifyZeroInteractions(mockRemoteDataSource);
          // verify(mockLocalDataSource.getLastNumberTrivia());
          // expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });

  group('getRandomNumberTrivia', () {
    final tNumberTriviaModel =
    // NumberTriviaModel(number: 123, text: 'test trivia');
    // final NumberTrivia tNumberTrivia = tNumberTriviaModel;

    test(
      'should check if the device is online',
          () async {
        // arrange
        // when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // // act
        // repository.getRandomNumberTrivia();
        // // assert
        // verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
            () async {
          // arrange
          // when(mockRemoteDataSource.getRandomNumberTrivia())
          //     .thenAnswer((_) async => tNumberTriviaModel);
          // // act
          // final result = await repository.getRandomNumberTrivia();
          // // assert
          // verify(mockRemoteDataSource.getRandomNumberTrivia());
          // expect(result, equals(Right(tNumberTrivia)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
            () async {
          // arrange
          // when(mockRemoteDataSource.getRandomNumberTrivia())
          //     .thenAnswer((_) async => tNumberTriviaModel);
          // // act
          // await repository.getRandomNumberTrivia();
          // // assert
          // verify(mockRemoteDataSource.getRandomNumberTrivia());
          // verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          // when(mockRemoteDataSource.getRandomNumberTrivia())
          //     .thenThrow(ServerException());
          // // act
          // final result = await repository.getRandomNumberTrivia();
          // // assert
          // verify(mockRemoteDataSource.getRandomNumberTrivia());
          // verifyZeroInteractions(mockLocalDataSource);
          // expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
            () async {
          // arrange
          // when(mockLocalDataSource.getLastNumberTrivia())
          //     .thenAnswer((_) async => tNumberTriviaModel);
          // // act
          // final result = await repository.getRandomNumberTrivia();
          // // assert
          // verifyZeroInteractions(mockRemoteDataSource);
          // verify(mockLocalDataSource.getLastNumberTrivia());
          // expect(result, equals(Right(tNumberTrivia)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
            () async {
          // arrange
          // when(mockLocalDataSource.getLastNumberTrivia())
          //     .thenThrow(CacheException());
          // // act
          // final result = await repository.getRandomNumberTrivia();
          // // assert
          // verifyZeroInteractions(mockRemoteDataSource);
          // verify(mockLocalDataSource.getLastNumberTrivia());
          // expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}