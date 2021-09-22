import 'package:crypto_tracker_app/data/models/coin_model/image.dart';
import 'package:crypto_tracker_app/data/models/coin_model/community_data.dart';
import 'package:crypto_tracker_app/data/models/coin_model/description.dart';
import 'package:crypto_tracker_app/data/models/coin_model/developer_data.dart';
import 'package:crypto_tracker_app/data/models/coin_model/links.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:equatable/equatable.dart';

class CoinResponse extends Equatable {

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

  const CoinResponse({
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

  Coin toEntity() {
    return Coin(
      id: id,
      symbol: symbol,
      name: name,
      platforms: platforms,
      blockTimeInMinutes: blockTimeInMinutes,
      algorithm: algorithm,
      categories: categories,
      description: description,
      links: links,
      image: image,
      genesisDate: genesisDate,
      sentimentVotesUpPercentage: sentimentVotesUpPercentage,
      sentimentVotesDownPercentage: sentimentVotesDownPercentage,
      marketCapRank: marketCapRank,
      coinGeckoRank: coinGeckoRank,
      coinGeckoScore: coinGeckoScore,
      developerScore: developerScore,
      communityScore: communityScore,
      liquidityScore: liquidityScore,
      publicInterestScore: publicInterestScore,
      developerData: developerData,
      communityData: communityData,
      lastUpdated: lastUpdated,
    );
  }

  factory CoinResponse.fromJson(Map<String, dynamic> data) {
    return CoinResponse(
      // id: data['id'] as String ?? '',
      id: data['id'] ?? '',
      symbol: data['symbol'] ?? '',
      name: data['name'] ?? '',
      platforms: Map<String, dynamic>.from(data['platforms'] ?? {}),
      blockTimeInMinutes: data['block_time_in_minutes'] ?? 0,
      algorithm: data['hashing_algorithm'] ?? '',
      categories: List<String>.from(data['categories'] ?? []),
      description: Description.fromJson(data['description'] ?? {}),
      links: Links.fromJson(data['links'] ?? {}),
      image: Image.fromJson(data['image'] ?? {}),
      genesisDate: data['genesis_date'] ?? '',
      sentimentVotesUpPercentage: data['sentiment_votes_up_percentage'] ?? 0.0,
      sentimentVotesDownPercentage: data['sentiment_votes_down_percentage'] ?? 0.0,
      marketCapRank: data['market_cap_rank'] ?? 0,
      coinGeckoRank: data['coingecko_rank'] ?? 0,
      coinGeckoScore: data['coingecko_score'] ?? 0.0,
      developerScore: data['developer_score'] ?? 0.0,
      communityScore: data['community_score'] ?? 0.0,
      liquidityScore: data['liquidity_score'] ?? 0.0,
      publicInterestScore: data['public_interest_score'] ?? 0.0,
      developerData: DeveloperData.fromJson(data['developer_data'] ?? {}),
      communityData: CommunityData.fromJson(data['community_data'] ?? {}),
      lastUpdated: DateTime.parse(data['last_updated'])
    );
  }
}