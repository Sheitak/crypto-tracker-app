import 'package:crypto_tracker_app/data/models/links.dart';
import 'package:crypto_tracker_app/data/models/Image.dart';
import 'package:equatable/equatable.dart';

class Coin extends Equatable {

  final String id;
  final String symbol;
  final String name;
  final Map<String, dynamic> platforms;
  final int blockTimeInMinutes;
  final String algorithm;
  final List<String> categories;
  final Map<String, dynamic> description;
  final Links links;
  final Image image;
  final String genesisDate;
  final double coinGeckoScore;
  final double developerScore;
  final double communityScore;
  final double liquidityScore;
  final double publicInterestScore;
  final Map<String, dynamic> communityData;

  const Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.platforms,
    required this.blockTimeInMinutes,
    required this.algorithm,
    required this.categories,
    required this.description,
    required this.links,
    required this.image,
    required this.genesisDate,
    required this.coinGeckoScore,
    required this.developerScore,
    required this.communityScore,
    required this.liquidityScore,
    required this.publicInterestScore,
    required this.communityData,
  });

  @override
  List<Object?> get props => [
    id,
    symbol,
    name,
    platforms,
    blockTimeInMinutes,
    algorithm,
    categories,
    description,
    links,
    image,
    genesisDate,
    coinGeckoScore,
    developerScore,
    communityScore,
    liquidityScore,
    publicInterestScore,
    communityData,
  ];
}