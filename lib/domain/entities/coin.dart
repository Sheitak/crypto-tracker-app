import 'package:crypto_tracker_app/data/models/coin_model/community_data.dart';
import 'package:crypto_tracker_app/data/models/coin_model/description.dart';
import 'package:crypto_tracker_app/data/models/coin_model/developer_data.dart';
import 'package:crypto_tracker_app/data/models/coin_model/links.dart';
import 'package:crypto_tracker_app/data/models/coin_model/Image.dart';
import 'package:equatable/equatable.dart';

class Coin extends Equatable {

  final String id;
  final String symbol;
  final String name;
  final Map<String, dynamic> platforms;
  final int blockTimeInMinutes;
  final String algorithm;
  final List<String> categories;
  final Description description;
  final Links links;
  final Image image;
  final String genesisDate;
  final double sentimentVotesUpPercentage;
  final double sentimentVotesDownPercentage;
  final int marketCapRank;
  final int coinGeckoRank;
  final double coinGeckoScore;
  final double developerScore;
  final double communityScore;
  final double liquidityScore;
  final double publicInterestScore;
  final CommunityData communityData;
  final DeveloperData developerData;
  final DateTime lastUpdated;

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
    required this.sentimentVotesUpPercentage,
    required this.sentimentVotesDownPercentage,
    required this.marketCapRank,
    required this.coinGeckoRank,
    required this.coinGeckoScore,
    required this.developerScore,
    required this.communityScore,
    required this.liquidityScore,
    required this.publicInterestScore,
    required this.developerData,
    required this.communityData,
    required this.lastUpdated,
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
    sentimentVotesUpPercentage,
    sentimentVotesDownPercentage,
    marketCapRank,
    coinGeckoRank,
    coinGeckoScore,
    developerScore,
    communityScore,
    liquidityScore,
    publicInterestScore,
    developerData,
    communityData,
    lastUpdated,
  ];
}