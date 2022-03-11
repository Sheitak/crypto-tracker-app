import 'package:equatable/equatable.dart';

abstract class CryptoRequest extends Equatable {
  Map<String, dynamic> toMap();
  @override
  List<Object?> get props => [];
}