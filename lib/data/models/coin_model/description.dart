import 'package:equatable/equatable.dart';

class Description extends Equatable {
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
  final String id;

  const Description({
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
    required this.id
  });

  @override
  List<Object?> get props => [
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
    id
  ];

  factory Description.fromJson(Map<String, dynamic> data) {
    return Description(
        en: data['en'] ?? '',
        de: data['de'] ?? '',
        es: data['es'] ?? '',
        fr: data['fr'] ?? '',
        it: data['it'] ?? '',
        pl: data['pl'] ?? '',
        ro: data['ro'] ?? '',
        hu: data['hu'] ?? '',
        nl: data['nl'] ?? '',
        pt: data['pt'] ?? '',
        sv: data['sv'] ?? '',
        vi: data['vi'] ?? '',
        tr: data['tr'] ?? '',
        ru: data['ru'] ?? '',
        ja: data['ja'] ?? '',
        zh: data['zh'] ?? '',
        zhtw: data['zh-tw'] ?? '',
        ko: data['ko'] ?? '',
        ar: data['ar'] ?? '',
        th: data['th'] ?? '',
        id: data['id'] ?? ''
    );
  }
}