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

  Map<String, dynamic> toMap() {
    final queryParameters = {
      'includePlatform': includePlatform
    };
    return queryParameters;
  }
}