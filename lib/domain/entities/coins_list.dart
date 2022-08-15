import 'package:crypto_tracker_app/core/providers/coin_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:objectbox/objectbox.dart';
import '../../presentation/viewmodel/favorites_screen_controller.dart';
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
  bool isFavorite;

  CoinsList({
    this.id = 0,
    required this.coinId,
    required this.name,
    required this.symbol,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
    id,
    coinId,
    name,
    symbol,
    isFavorite
  ];

  CoinsList copyWith({String? coinId, String? name, String? symbol, bool? isFavorite}) {
    return CoinsList(
      coinId: coinId ?? this.coinId,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      isFavorite: isFavorite ?? this.isFavorite
    );
  }

  void toggleFavorite(WidgetRef ref) {
    isFavorite = !isFavorite;
    ref.read(updateFavoritesController.notifier).updateFavorites(coinId, isFavorite);
  }
}