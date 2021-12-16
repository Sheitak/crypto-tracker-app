import 'package:equatable/equatable.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';

class ImageResponse extends Equatable {
  final String thumb;
  final String small;
  final String large;

  const ImageResponse({
    required this.thumb,
    required this.small,
    required this.large
  });

  @override
  List<Object?> get props => [
    thumb,
    small,
    large
  ];

  Image toEntity() {
    return Image(
        thumb: thumb,
        small: small,
        large: large
    );
  }

  factory ImageResponse.fromJson(Map<String, dynamic> data) {
    return ImageResponse(
      thumb: data['thumb'] ?? '',
      small: data['small'] ?? '',
      large: data['large'] ?? '',
    );
  }
}