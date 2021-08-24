import 'package:equatable/equatable.dart';

class CoinsListRequest extends Equatable {
  final bool includePlatform;

  const CoinsListRequest({
    required this.includePlatform
  });

  @override
  List<Object?> get props => [
    includePlatform
  ];

  Map<String, bool> toMap() {
    final queryParameters = {
      'include_platform': includePlatform
    };
    return queryParameters;
  }
}