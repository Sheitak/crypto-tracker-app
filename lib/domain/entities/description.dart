import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Description extends Equatable {
  int id;
  final String en;
  final String de;
  final String es;
  final String fr;
  final String it;
  final String pl;
  final String ro;
  final String hu;
  final String nl;
  final String pt;
  final String sv;
  final String vi;
  final String tr;
  final String ru;
  final String ja;
  final String zh;
  final String zhtw;
  final String ko;
  final String ar;
  final String th;
  final String idd;
  final coin = ToOne<Coin>();

  Description({
    this.id = 0,
    required this.en,
    required this.de,
    required this.es,
    required this.fr,
    required this.it,
    required this.pl,
    required this.ro,
    required this.hu,
    required this.nl,
    required this.pt,
    required this.sv,
    required this.vi,
    required this.tr,
    required this.ru,
    required this.ja,
    required this.zh,
    required this.zhtw,
    required this.ko,
    required this.ar,
    required this.th,
    required this.idd
  });

  @override
  List<Object?> get props => [
    id,
    en,
    de,
    es,
    fr,
    it,
    pl,
    ro,
    hu,
    nl,
    pt,
    sv,
    vi,
    tr,
    ru,
    ja,
    zh,
    zhtw,
    ko,
    ar,
    th,
    idd
  ];
}