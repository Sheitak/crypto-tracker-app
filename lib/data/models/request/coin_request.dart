import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';

class CoinRequest extends CryptoRequest {
  final String localization;
  final bool tickers;
  final bool marketData;
  final bool communityData;
  final bool developerData;
  final bool sparkline;

  CoinRequest({
    required this.localization,
    required this.tickers,
    required this.marketData,
    required this.communityData,
    required this.developerData,
    required this.sparkline
  });

  @override
  List<Object?> get props => [
    localization,
    tickers,
    marketData,
    communityData,
    developerData,
    sparkline
  ];

  @override
  Map<String, dynamic> toMap() {
    final queryParameters = {
      'localization': localization,
      'tickers': tickers,
      'market_data': marketData,
      'community_data': communityData,
      'developer_data': developerData,
      'sparkline': sparkline,
    };
    return queryParameters;
  }
}