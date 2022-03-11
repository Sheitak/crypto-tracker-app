import 'package:crypto_tracker_app/data/models/request/crypto_request.dart';

class CoinsListRequest extends CryptoRequest {
  final bool includePlatform;

  CoinsListRequest({
    required this.includePlatform
  });

  @override
  List<Object?> get props => [
    includePlatform
  ];

  @override
  Map<String, bool> toMap() {
    final queryParameters = {
      'include_platform': includePlatform
    };
    return queryParameters;
  }
}