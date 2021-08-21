import 'package:equatable/equatable.dart';

class CoinsListState extends Equatable {
  final String selectedCoin;
  final int coinsNumber;

  const CoinsListState({
    required this.selectedCoin,
    required this.coinsNumber
  });

  @override
  List<Object?> get props => [
    selectedCoin,
    coinsNumber
  ];

  factory CoinsListState.initial() {
    return CoinsListState(
      selectedCoin: '',
      coinsNumber: 25
    );
  }

  CoinsListState copyWith({
    String? selectedCoin,
    int? coinsNumber
  }) {
    return CoinsListState(
      selectedCoin: selectedCoin ?? this.selectedCoin,
      coinsNumber: coinsNumber ?? this.coinsNumber
    );
  }
}