import 'package:crypto_tracker_app/core/usecases/usecase.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/repositories/coins_list_repository.dart';
import 'package:crypto_tracker_app/domain/repositories/crypto_repository.dart';
import 'package:crypto_tracker_app/domain/usecases/get_coins_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart' ;
import 'get_coins_list_test.mocks.dart';

@GenerateMocks([CoinsListRepository, CryptoRepository])
void main() {
  late GetCoinsList useCase;
  late MockCoinsListRepository mockCoinsListRepository;
  // late MockCryptoRepository mockCryptoRepository;
  late List<CoinsList> tCoinsList;

  setUp(() {
    mockCoinsListRepository = MockCoinsListRepository();
    // mockCryptoRepository = MockCryptoRepository();
    useCase = GetCoinsList(
        // cryptoRepository: mockCryptoRepository
        coinsListRepository: mockCoinsListRepository
    );
    tCoinsList = [
      CoinsList(coinId: 'bitcoin', name: 'bitcoin', symbol: 'BTC'),
      CoinsList(coinId: 'ethereum', name: 'ethereum', symbol: 'ETH')
    ];
  });

  // flutter test test/domain/usecases/get_coins_list_test.dart
  test('should get the list of cryptocurrencies', () async {
    // La phase "arrange". Implémentation "à la volée" du Repository à l'aide du package Mockito.
    // Lorsque getCoinsList est appelé avec n'importe quel argument, répondez toujours avec
    // le "côté" droit de "Either" contenant un objet de test CoinsList.
    when(mockCoinsListRepository.getCoinsList())
        .thenAnswer((_) async => Right(tCoinsList));

    // La phase « act » du test. Appelez la méthode pas encore existante.
    // Comme la liste de cryptomonnaies ne nécessite aucun paramètre, nous passons NoParams.
    final result = await useCase(NoParams());

    // La phase "assert".
    // UseCase devrait simplement renvoyer tout ce qui a été renvoyé du référentiel.
    expect(result, Right(tCoinsList));
    // expect(result, equals(Right(tCoinsList)));

    // Vérifier que la méthode a été appelée sur le Repository.
    verify(mockCoinsListRepository.getCoinsList());

    // Seule la méthode ci-dessus doit être appelée et rien de plus.
    verifyNoMoreInteractions(mockCoinsListRepository);
  });

  // test('should get the list of cryptocurrencies', () async {
  //   // La phase "arrange". Implémentation "à la volée" du Repository à l'aide du package Mockito.
  //   // Lorsque getCoinsList est appelé avec n'importe quel argument, répondez toujours avec
  //   // le "côté" droit de "Either" contenant un objet de test CoinsList.
  //   when(mockCryptoRepository.getCoinsList())
  //       .thenAnswer((_) async => Right(tCoinsList));
  //
  //   // La phase « act » du test. Appelez la méthode pas encore existante.
  //   // Comme la liste de cryptomonnaies ne nécessite aucun paramètre, nous passons NoParams.
  //   final result = await useCase(NoParams());
  //
  //   // La phase "assert".
  //   // UseCase devrait simplement renvoyer tout ce qui a été renvoyé du référentiel.
  //   expect(result, Right(tCoinsList));
  //   // expect(result, equals(Right(tCoinsList)));
  //
  //   // Vérifier que la méthode a été appelée sur le Repository.
  //   verify(mockCryptoRepository.getCoinsList());
  //
  //   // Seule la méthode ci-dessus doit être appelée et rien de plus.
  //   verifyNoMoreInteractions(mockCryptoRepository);
  // });
}