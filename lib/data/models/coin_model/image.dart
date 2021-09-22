import 'package:equatable/equatable.dart';

class Image extends Equatable {

  final String thumb;
  final String small;
  final String large;

  const Image({
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

  factory Image.fromJson(Map<String, dynamic> data) {
    return Image(
      thumb: data['thumb'] ?? '',
      small: data['small'] ?? '',
      large: data['large'] ?? '',
    );
  }
}