import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/usecases/coins_list_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: Modifier le typage List<CoinList> en prenant exemple sur coinListUseCase, modèle de la ligne 10

// class CoinsListNotifier {
//
//   final CoinsListUseCase _coinsListUseCase;
//
//   CoinsListNotifier(this. _coinsListUseCase);
//
//   Future<List<CoinsList>> getCoinsList() {
//     return _coinsListUseCase.getCoinsList();
//   }
// }


// class CoinsListViewModel extends Equatable {
//
//   final List<CoinsList> coinsList;
//
//   const CoinsListViewModel({
//     required this.coinsList
//   });
//
//   @override
//   List<Object?> get props => [
//     coinsList
//   ];
//
//   factory CoinsListViewModel.initial() {
//     return CoinsListViewModel(
//       coinsList: [],
//     );
//   }
// }