import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(
      [List properties = const<dynamic>[]]
  ): super();

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;
  final int code;

  const ServerFailure({
    this.message = 'ServerFailure : Internal Server Error, server has encountered a problem.',
    this.code = 500
  });

  @override
  List<Object> get props => [
    message,
    code
  ];
}

class CacheFailure extends Failure {
  final String message;
  final int code;

  const CacheFailure({
    this.message = 'CacheFailure : Data Not Found.',
    this.code = 404
  });

  @override
  List<Object> get props => [
    message,
    code
  ];
}

class InvalidInputFailure extends Failure {}

class StandardFailure extends Failure {
  final String message;
  final int code;

  const StandardFailure({
    required this.message,
    required this.code
  });

  @override
  List<Object> get props => [
    message,
    code
  ];
}