import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';

@Entity()
class Platforms extends Equatable {
  int id;
  final String kardiachain;
  final String moonriver;
  final String sora;
  final String tomochain;
  final coin = ToOne<Coin>();

  Platforms({
    this.id = 0,
    required this.kardiachain,
    required this.moonriver,
    required this.sora,
    required this.tomochain,
  });

  @override
  List<Object?> get props => [
    id,
    kardiachain,
    moonriver,
    sora,
    tomochain
  ];
}