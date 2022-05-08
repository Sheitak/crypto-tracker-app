import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';

class DataTypeConverter {
  Either<Failure, Map> stringToMapConvert(String element) {
    try {
      final map = Map.from(
          json.decode(element).map(
              (key, value) => MapEntry(key as dynamic, value as dynamic)
          )
      );
      return Right(map);
    } on FormatException {
      return Left(
          InvalidConversionTypeFailure()
      );
    }
  }

  // Either<Failure, String> mapToStringConvert(Map element) {
  //   try {
  //     final string = json.encode(element);
  //     return Right(string);
  //   } on FormatException {
  //     return Left(
  //         InvalidConversionTypeFailure()
  //     );
  //   }
  // }

  String mapToStringConvert(Map element) {
    try {
      final string = json.encode(element);
      return string;
    } on FormatException {
      throw InvalidConversionTypeFailure();
    }
  }

  Either<Failure, int> stringToUnsignedInteger(String element) {
    try {
      final integer = int.parse(element);
      if (integer < 0) {
        throw const FormatException();
      }
      return Right(integer);
    } on FormatException {
      return Left(
          InvalidInputFailure()
      );
    }
  }

  Either<Failure, String> integerToUnsignedString(int element) {
    try {
      final string = element.toString();
      // if (integer < 0) throw const FormatException();
      return Right(string);
    } on FormatException {
      return Left(
          InvalidInputFailure()
      );
    }
  }

  List<String> variousListToStringList(List<dynamic>? targetList) {
      final List<String> targetListNotNull = [];
      if (targetList != null) {
        for (var element in targetList) {
          if (element != null) {
            targetListNotNull.add(element.toString());
          }
        }
      }
      return targetListNotNull;
  }

  // set dbImage(String element) => image = ImageResponse.fromJson(
  //     json.decode(element).map((key, value) => MapEntry(key as String, value as dynamic))
  // ) as String;

  // String get dbDescription => json.encode(description);
  // set dbDescription(String element) => description = Description.fromJson(
  //     json.decode(element).map((key, value) => MapEntry(key as String, value as dynamic))
  // );
}