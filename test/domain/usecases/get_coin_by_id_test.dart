import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:crypto_tracker_app/domain/usecases/get_coin_by_id.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'get_coin_by_id_test.mocks.dart';

@GenerateMocks([CoinRepository])
void main() {
  late GetCoinById useCase;
  late MockCoinRepository mockCoinRepository;
  late String tSelectedCoin;
  late List<dynamic> tEntities;


  setUp(() {
    mockCoinRepository = MockCoinRepository();
    useCase = GetCoinById(
        coinRepository: mockCoinRepository
    );
    tSelectedCoin = 'bitcoin';
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

  // flutter test test/domain/usecases/get_coin_by_id_test.dart
  test('should get a list of entities corresponding to the ownership of a single cryptocurrency', () async {
    // arrange
    when(mockCoinRepository.getCoinById(tSelectedCoin))
        .thenAnswer((_) async => Right(tEntities));

    // act
    final result = await useCase(Params(selectedCoin: tSelectedCoin));

    // assert
    expect(result, Right(tEntities));
    verify(mockCoinRepository.getCoinById(tSelectedCoin));
    verifyNoMoreInteractions(mockCoinRepository);
  });
}