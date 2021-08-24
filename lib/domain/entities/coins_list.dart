import 'package:equatable/equatable.dart';

class CoinsList extends Equatable{

  final String id;
  final String name;
  final String symbol;
  final Map<String, dynamic> platforms;

  const CoinsList({
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
}