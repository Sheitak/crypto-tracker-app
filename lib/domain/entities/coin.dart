import 'dart:convert';

import 'package:crypto_tracker_app/data/models/coin_properties_model/image_response.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Coin extends Equatable {
  int id;
  @Index()
  final String coinId;
  final String symbol;
  final String name;
  final int blockTimeInMinutes;
  final String algorithm;
  final List<String> categories;
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
  @Property(type: PropertyType.date)
  final DateTime lastUpdated;
  final coinList = ToOne<CoinsList>();
  final image = ToOne<Image>();

  Coin({
    this.id = 0,
    required this.coinId,
    required this.symbol,
    required this.name,
    required this.blockTimeInMinutes,
    required this.algorithm,
    required this.categories,
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
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
    id,
    coinId,
    symbol,
    name,
    blockTimeInMinutes,
    algorithm,
    categories,
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
    lastUpdated,
  ];
  // set dbImage(String element) => image = ImageResponse.fromJson(
  //     json.decode(element).map((key, value) => MapEntry(key as String, value as dynamic))
  // ) as String;

  // String get dbDescription => json.encode(description);
  // set dbDescription(String element) => description = Description.fromJson(
  //     json.decode(element).map((key, value) => MapEntry(key as String, value as dynamic))
  // );
}