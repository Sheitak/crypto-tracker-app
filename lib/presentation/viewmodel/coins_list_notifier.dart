import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/usecases/coins_list_usecase.dart';
import 'package:crypto_tracker_app/presentation/viewmodel/coins_list_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final coinsListViewModelProvider = StateNotifierProvider.autoDispose<CoinsListNotifier, CoinsListViewModel>(
//         (ref) => CoinsListNotifier(ref.read(coinsListUseCaseProvider))
// );
// final coinsListProvider = FutureProvider.autoDispose<List<CoinsList>>(
//         (ref) => ref.watch(coinsListViewModelProvider.notifier).getCoinsList());

final coinsListViewModelProvider = Provider<CoinsListNotifier>(
        (ref) => CoinsListNotifier(ref.read(coinsListUseCaseProvider))
);

class CoinsListNotifier {

  final CoinsListUseCase _coinsListUseCase;

  CoinsListNotifier(this. _coinsListUseCase);

  Future<List<CoinsList>> getCoinsList() {
    return _coinsListUseCase.getCoinsList();
  }
}


// class CoinsListNotifier extends StateNotifier<CoinsListViewModel> {
//
//   final CoinsListUseCase _coinsListUseCase;
//
//   CoinsListNotifier(this. _coinsListUseCase) : super();
//   // CoinsListViewModel(this. _coinsListUseCase) : super(CoinsListState(coinsList: _coinsListUseCase));
//
//   Future<List<CoinsList>> getCoinsList() {
//     return _coinsListUseCase.getCoinsList();
//   }
// }