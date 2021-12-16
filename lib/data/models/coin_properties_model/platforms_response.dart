import 'package:crypto_tracker_app/domain/entities/platforms.dart';
import 'package:equatable/equatable.dart';

class PlatformsResponse extends Equatable {
  final String kardiachain;
  final String moonriver;
  final String sora;
  final String tomochain;

  const PlatformsResponse({
    required this.kardiachain,
    required this.moonriver,
    required this.sora,
    required this.tomochain,
  });

  @override
  List<Object?> get props => [
    kardiachain,
    moonriver,
    sora,
    tomochain
  ];

  Platforms toEntity() {
    return Platforms(
        kardiachain: kardiachain,
        moonriver: moonriver,
        sora: sora,
        tomochain: tomochain
    );
  }

  factory PlatformsResponse.fromJson(Map<String, dynamic> data) {
    return PlatformsResponse(
      kardiachain: data['kardiachain'] ?? '',
      moonriver: data['moonriver'] ?? '',
      sora: data['sora'] ?? '',
      tomochain: data['tomochain'] ?? '',
    );
  }
}