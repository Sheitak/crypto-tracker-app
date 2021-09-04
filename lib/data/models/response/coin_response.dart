import 'package:crypto_tracker_app/data/models/Image.dart';
import 'package:crypto_tracker_app/data/models/links.dart';
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
  final Map<String, dynamic> description;
  final Links links;
  final Image image;
  final String genesisDate;
  final int marketCapRank;
  final int coinGeckoRank;
  final double coinGeckoScore;
  final double developerScore;
  final double communityScore;
  final double liquidityScore;
  final double publicInterestScore;
  final Map<String, dynamic> communityData;

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
    required this.coinGeckoScore,
    required this.marketCapRank,
    required this.coinGeckoRank,
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
    marketCapRank,
    coinGeckoRank,
    developerScore,
    communityScore,
    liquidityScore,
    publicInterestScore,
    communityData,
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
      marketCapRank: marketCapRank,
      coinGeckoRank: coinGeckoRank,
      coinGeckoScore: coinGeckoScore,
      developerScore: developerScore,
      communityScore: communityScore,
      liquidityScore: liquidityScore,
      publicInterestScore: publicInterestScore,
      communityData: communityData,
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
      description: Map<String, dynamic>.from(data['description'] ?? {}),
      links: Links.fromJson(data['links'] ?? {}),
      image: Image.fromJson(data['image'] ?? {}),
      genesisDate: data['genesis_date'] ?? '',
      marketCapRank: data['market_cap_rank'] ?? 0,
      coinGeckoRank: data['coingecko_rank'] ?? 0,
      coinGeckoScore: data['coingecko_score'] ?? 0.000,
      developerScore: data['developer_score'] ?? 0.000,
      communityScore: data['community_score'] ?? 0.000,
      liquidityScore: data['liquidity_score'] ?? 0.000,
      publicInterestScore: data['public_interest_score'] ?? 0.000,
      communityData: Map<String, dynamic>.from(data['community_data'] ?? {}),
    );
  }
}