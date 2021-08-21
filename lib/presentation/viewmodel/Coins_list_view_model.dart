import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/usecases/coins_list_usecase.dart';
import 'package:crypto_tracker_app/presentation/viewmodel/coins_list_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final coinsListViewModelProvider = StateNotifierProvider.autoDispose<CoinsListViewModel, CoinsListState>(
        (ref) => CoinsListViewModel(ref.read(coinsListUseCaseProvider))
);
final coinsListProvider = FutureProvider.autoDispose<List<CoinsList>>(
        (ref) => ref.watch(coinsListViewModelProvider.notifier).getCoinsList());

class CoinsListViewModel extends StateNotifier<CoinsListState> {

  final CoinsListUseCase _coinsListUseCase;

  CoinsListViewModel(this. _coinsListUseCase) : super(CoinsListState.initial());

  Future<List<CoinsList>> getCoinsList() {
    return _coinsListUseCase.getCoinsList();
  }

  void reset() {
    state = CoinsListState.initial();
  }

}