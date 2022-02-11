import 'package:dartz/dartz.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';

// TODO : Convertir Map To String pour ObjectBox
// Intégrer le converter dans le state repositoryimpl riverpod
class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw const FormatException();
      return Right(integer);
    } on FormatException {
      return Left(
          InvalidInputFailure()
      );
    }
  }
}