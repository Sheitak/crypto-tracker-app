import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:equatable/equatable.dart';

class CoinsListResponse extends Equatable {
  final String id;
  final String name;
  final String symbol;

  const CoinsListResponse({
    required this.id,
    required this.name,
    required this.symbol,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    symbol,
  ];

  CoinsList toEntity() {
    return CoinsList(
        coinId: id,
        name: name,
        symbol: symbol,
    );
  }

  factory CoinsListResponse.fromJson(Map<String, dynamic> data) {
    return CoinsListResponse(
        id: data['id'] ?? '',
        name: data['name'] ?? '',
        symbol: data['symbol'] ?? '',
    );
  }
}