import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Image extends Equatable {
  int id;
  final String thumb;
  final String small;
  final String large;
  final coin = ToOne<Coin>();

  Image({
    this.id = 0,
    required this.thumb,
    required this.small,
    required this.large,
  });

  @override
  List<Object?> get props => [
    id,
    thumb,
    small,
    large,
    coin
  ];
}