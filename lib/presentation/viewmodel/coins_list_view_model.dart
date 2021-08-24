import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:equatable/equatable.dart';

class CoinsListViewModel extends Equatable {

  final List<CoinsList> coinsList;

  const CoinsListViewModel({
    required this.coinsList
  });

  @override
  List<Object?> get props => [
    coinsList
  ];

  // factory CoinsListViewModel.initial() {
  //   return CoinsListViewModel(
  //     coinsList: [],
  //   );
  // }
}