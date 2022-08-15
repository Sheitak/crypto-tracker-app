import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/domain/usecases/usecase.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PostTicketSupport implements UseCase<List, Params> {

  final CoinRepository coinRepository;

  PostTicketSupport({
    required this.coinRepository
  });

  @override
  Future<Either<Failure, List<dynamic>>> call(Params params) async {
    return await coinRepository.getCoinById('test');
  }
}

class Params extends Equatable {
  final Map<String, dynamic> ticketParameters;

  const Params({
    required this.ticketParameters
  });

  @override
  List<Object?> get props => [
    ticketParameters
  ];
}