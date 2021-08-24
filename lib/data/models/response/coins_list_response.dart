import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:equatable/equatable.dart';

class CoinsListResponse extends Equatable {

  final String id;
  final String name;
  final String symbol;
  final Map<String, dynamic> platforms;

  const CoinsListResponse({
    required this.id,
    required this.name,
    required this.symbol,
    required this.platforms
  });

  @override
  List<Object?> get props => [
    id,
    name,
    symbol,
    platforms
  ];

  CoinsList toEntity() {
    return CoinsList(
        id: id,
        name: name,
        symbol: symbol,
        platforms: platforms
    );
  }

  factory CoinsListResponse.fromMap(Map<String, dynamic> map) {
    return CoinsListResponse(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        symbol: map['symbol'] ?? '',
        platforms: Map<String, dynamic>.from(map['platforms'] ?? {})
    );
  }
}