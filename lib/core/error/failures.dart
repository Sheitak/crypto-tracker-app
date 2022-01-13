import 'package:equatable/equatable.dart';

abstract class FailureR extends Equatable {
  const FailureR([List properties = const<dynamic>[]]): super();
}

class Failure extends FailureR {
  final String message;

  const Failure ({
    this.message = ''
  });

  @override
  List<Object> get props => [
    message
  ];
}

// class Failure extends Equatable {
//   final String message;
//
//   const Failure ({
//       this.message = ''
//   });
//
//   @override
//   List<Object> get props => [
//     message
//   ];
// }