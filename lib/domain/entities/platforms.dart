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

// "platforms": {
//     "": "",
//     "kardiachain": "0x1540020a94aa8bc189aa97639da213a4ca49d9a7",
//     "moonriver": "0x639a647fbe20b6c8ac19e48e2de44ea792c62c5c",
//     "sora": "0x0200070000000000000000000000000000000000000000000000000000000000 ",
//     "tomochain": "0x2eaa73bd0db20c64f53febea7b5f5e5bccc7fb8b"
// },
}