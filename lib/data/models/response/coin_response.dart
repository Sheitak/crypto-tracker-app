import 'package:crypto_tracker_app/data/models/coin_properties_model/community_data_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/description_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/developer_data_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/image_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/links_response.dart';
import 'package:crypto_tracker_app/data/models/coin_properties_model/platforms_response.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/entities/community_data.dart';
import 'package:crypto_tracker_app/domain/entities/description.dart';
import 'package:crypto_tracker_app/domain/entities/developer_data.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';
import 'package:crypto_tracker_app/domain/entities/links.dart';
import 'package:crypto_tracker_app/domain/entities/platforms.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

class CoinResponse extends Equatable {
  final String coinId;
  final String symbol;
  final String name;
  final PlatformsResponse platforms;
  final int blockTimeInMinutes;
  final String algorithm;
  final List<String> categories;
  final DescriptionResponse description;
  final LinksResponse links;
  final ImageResponse image;
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
  final CommunityDataResponse communityData;
  final DeveloperDataResponse developerData;
  final DateTime lastUpdated;

  const CoinResponse({
    required this.coinId,
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
    coinId,
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
      coinId: coinId,
      symbol: symbol,
      name: name,
      blockTimeInMinutes: blockTimeInMinutes,
      algorithm: algorithm,
      categories: categories,
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
      lastUpdated: lastUpdated,
    );
  }

  List<dynamic> toEntities() {
    final List<dynamic> entities = [];

    final Coin coinEntity = toEntity();
    final Image imageEntity = image.toEntity();
    final Links linksEntity = links.toEntity();
    final Description descriptionEntity = description.toEntity();
    final CommunityData communityDataEntity = communityData.toEntity();
    final DeveloperData developerDataEntity = developerData.toEntity();
    final Platforms platformsEntity = platforms.toEntity();

    entities.add(coinEntity);
    entities.add(imageEntity);
    entities.add(linksEntity);
    entities.add(descriptionEntity);
    entities.add(communityDataEntity);
    entities.add(developerDataEntity);
    entities.add(platformsEntity);

    return entities;
  }

  factory CoinResponse.fromJson(Map<String, dynamic> data) {
    // var list = data['image'] as List;
    // List<String> imageList = list.map((element) => ImageResponse.fromJson(element)).toList() as List<String>;
    // [ERROR:flutter/lib/ui/ui_dart_state.cc(209)] Unhandled Exception: type '(dynamic) => ImageResponse'
    // is not a subtype of type '(String, dynamic) => MapEntry<dynamic, dynamic>' of 'transform'

    String jsonStringImage = json.encode(Map<String, String>.from(data['image'] ?? {}));

    return CoinResponse(
      coinId: data['id'] ?? '',
      symbol: data['symbol'] ?? '',
      name: data['name'] ?? '',
      platforms: PlatformsResponse.fromJson(data['platforms'] ?? {}),
      blockTimeInMinutes: data['block_time_in_minutes'] ?? 0,
      algorithm: data['hashing_algorithm'] ?? '',
      categories: List<String>.from(data['categories'] ?? []),
      description: DescriptionResponse.fromJson(data['description'] ?? {}),
      links: LinksResponse.fromJson(data['links'] ?? {}),
      image: ImageResponse.fromJson(data['image'] ?? {}),
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
      developerData: DeveloperDataResponse.fromJson(data['developer_data'] ?? {}),
      communityData: CommunityDataResponse.fromJson(data['community_data'] ?? {}),
      lastUpdated: DateTime.parse(data['last_updated'])
    );
  }
}