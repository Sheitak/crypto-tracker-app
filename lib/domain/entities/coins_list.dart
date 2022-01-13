import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';
import 'coin.dart';

@Entity()
class CoinsList extends Equatable{
  int id;
  @Index()
  final String coinId;
  final String name;
  final String symbol;
  @Backlink('coinList')
  final coins = ToMany<Coin>();

  CoinsList({
    this.id = 0,
    required this.coinId,
    required this.name,
    required this.symbol,
  });

  @override
  List<Object?> get props => [
    id,
    coinId,
    name,
    symbol
  ];
}