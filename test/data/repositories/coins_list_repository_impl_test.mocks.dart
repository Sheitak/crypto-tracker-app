// Mocks generated by Mockito 5.1.0 from annotations
// in crypto_tracker_app/test/data/repositories/coins_list_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:crypto_tracker_app/core/network/network_info.dart' as _i9;
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart'
    as _i7;
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart'
    as _i3;
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart'
    as _i6;
import 'package:crypto_tracker_app/data/models/response/coin_response.dart'
    as _i2;
import 'package:crypto_tracker_app/data/models/response/coins_list_response.dart'
    as _i5;
import 'package:crypto_tracker_app/domain/entities/coins_list.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeCoinResponse_0 extends _i1.Fake implements _i2.CoinResponse {}

/// A class which mocks [CryptoRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCryptoRemoteDataSource extends _i1.Mock
    implements _i3.CryptoRemoteDataSource {
  MockCryptoRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.CoinsListResponse>> getCoinsList(
          _i6.CryptoRequest? request) =>
      (super.noSuchMethod(Invocation.method(#getCoinsList, [request]),
              returnValue: Future<List<_i5.CoinsListResponse>>.value(
                  <_i5.CoinsListResponse>[]))
          as _i4.Future<List<_i5.CoinsListResponse>>);
  @override
  _i4.Future<_i2.CoinResponse> getCoinById(
          String? selectedCoin, _i6.CryptoRequest? request) =>
      (super.noSuchMethod(
              Invocation.method(#getCoinById, [selectedCoin, request]),
              returnValue:
                  Future<_i2.CoinResponse>.value(_FakeCoinResponse_0()))
          as _i4.Future<_i2.CoinResponse>);
}

/// A class which mocks [CryptoLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCryptoLocalDataSource extends _i1.Mock
    implements _i7.CryptoLocalDataSource {
  MockCryptoLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i8.CoinsList>> getLastCoinsList() =>
      (super.noSuchMethod(Invocation.method(#getLastCoinsList, []),
              returnValue: Future<List<_i8.CoinsList>>.value(<_i8.CoinsList>[]))
          as _i4.Future<List<_i8.CoinsList>>);
  @override
  _i4.Future<void> cacheCoinsList(List<_i8.CoinsList>? coinsListToCache) =>
      (super.noSuchMethod(
          Invocation.method(#cacheCoinsList, [coinsListToCache]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<List<dynamic>> getLastCoin(String? selectedCoin) =>
      (super.noSuchMethod(Invocation.method(#getLastCoin, [selectedCoin]),
              returnValue: Future<List<dynamic>>.value(<dynamic>[]))
          as _i4.Future<List<dynamic>>);
  @override
  _i4.Future<void> cacheCoin(List<dynamic>? entitiesListToCache) =>
      (super.noSuchMethod(Invocation.method(#cacheCoin, [entitiesListToCache]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
}

/// A class which mocks [CryptoRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCryptoRequest extends _i1.Mock implements _i6.CryptoRequest {
  MockCryptoRequest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object?> get props =>
      (super.noSuchMethod(Invocation.getter(#props), returnValue: <Object?>[])
          as List<Object?>);
  @override
  Map<String, dynamic> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i9.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}