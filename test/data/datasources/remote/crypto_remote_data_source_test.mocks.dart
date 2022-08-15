// Mocks generated by Mockito 5.2.0 from annotations
// in crypto_tracker_app/test/data/datasources/remote/crypto_remote_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;

import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source_impl.dart'
    as _i11;
import 'package:crypto_tracker_app/data/models/request/coin_request.dart'
    as _i14;
import 'package:crypto_tracker_app/data/models/request/coins_list_request.dart'
    as _i15;
import 'package:crypto_tracker_app/data/models/request/crypto_request.dart'
    as _i13;
import 'package:crypto_tracker_app/data/models/response/coin_response.dart'
    as _i7;
import 'package:crypto_tracker_app/data/models/response/coins_list_response.dart'
    as _i12;
import 'package:dio/dio.dart' as _i8;
import 'package:dio/src/adapter.dart' as _i3;
import 'package:dio/src/cancel_token.dart' as _i10;
import 'package:dio/src/dio_mixin.dart' as _i5;
import 'package:dio/src/options.dart' as _i2;
import 'package:dio/src/response.dart' as _i6;
import 'package:dio/src/transformer.dart' as _i4;
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

class _FakeBaseOptions_0 extends _i1.Fake implements _i2.BaseOptions {}

class _FakeHttpClientAdapter_1 extends _i1.Fake
    implements _i3.HttpClientAdapter {}

class _FakeTransformer_2 extends _i1.Fake implements _i4.Transformer {}

class _FakeInterceptors_3 extends _i1.Fake implements _i5.Interceptors {}

class _FakeResponse_4<T> extends _i1.Fake implements _i6.Response<T> {}

class _FakeCoinResponse_5 extends _i1.Fake implements _i7.CoinResponse {}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDio extends _i1.Mock implements _i8.Dio {
  MockDio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BaseOptions get options =>
      (super.noSuchMethod(Invocation.getter(#options),
          returnValue: _FakeBaseOptions_0()) as _i2.BaseOptions);
  @override
  set options(_i2.BaseOptions? _options) =>
      super.noSuchMethod(Invocation.setter(#options, _options),
          returnValueForMissingStub: null);
  @override
  _i3.HttpClientAdapter get httpClientAdapter =>
      (super.noSuchMethod(Invocation.getter(#httpClientAdapter),
          returnValue: _FakeHttpClientAdapter_1()) as _i3.HttpClientAdapter);
  @override
  set httpClientAdapter(_i3.HttpClientAdapter? _httpClientAdapter) => super
      .noSuchMethod(Invocation.setter(#httpClientAdapter, _httpClientAdapter),
          returnValueForMissingStub: null);
  @override
  _i4.Transformer get transformer =>
      (super.noSuchMethod(Invocation.getter(#transformer),
          returnValue: _FakeTransformer_2()) as _i4.Transformer);
  @override
  set transformer(_i4.Transformer? _transformer) =>
      super.noSuchMethod(Invocation.setter(#transformer, _transformer),
          returnValueForMissingStub: null);
  @override
  _i5.Interceptors get interceptors =>
      (super.noSuchMethod(Invocation.getter(#interceptors),
          returnValue: _FakeInterceptors_3()) as _i5.Interceptors);
  @override
  void close({bool? force = false}) =>
      super.noSuchMethod(Invocation.method(#close, [], {#force: force}),
          returnValueForMissingStub: null);
  @override
  _i9.Future<_i6.Response<T>> get<T>(String? path,
          {Map<String, dynamic>? queryParameters,
          _i2.Options? options,
          _i10.CancelToken? cancelToken,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#get, [
                path
              ], {
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> getUri<T>(Uri? uri,
          {_i2.Options? options,
          _i10.CancelToken? cancelToken,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#getUri, [
                uri
              ], {
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> post<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i2.Options? options,
          _i10.CancelToken? cancelToken,
          _i2.ProgressCallback? onSendProgress,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> postUri<T>(Uri? uri,
          {dynamic data,
          _i2.Options? options,
          _i10.CancelToken? cancelToken,
          _i2.ProgressCallback? onSendProgress,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#postUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> put<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i2.Options? options,
          _i10.CancelToken? cancelToken,
          _i2.ProgressCallback? onSendProgress,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> putUri<T>(Uri? uri,
          {dynamic data,
          _i2.Options? options,
          _i10.CancelToken? cancelToken,
          _i2.ProgressCallback? onSendProgress,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#putUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> head<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i2.Options? options,
          _i10.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#head, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> headUri<T>(Uri? uri,
          {dynamic data,
          _i2.Options? options,
          _i10.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#headUri, [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken}),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> delete<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i2.Options? options,
          _i10.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> deleteUri<T>(Uri? uri,
          {dynamic data,
          _i2.Options? options,
          _i10.CancelToken? cancelToken}) =>
      (super.noSuchMethod(
              Invocation.method(#deleteUri, [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken}),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> patch<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i2.Options? options,
          _i10.CancelToken? cancelToken,
          _i2.ProgressCallback? onSendProgress,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> patchUri<T>(Uri? uri,
          {dynamic data,
          _i2.Options? options,
          _i10.CancelToken? cancelToken,
          _i2.ProgressCallback? onSendProgress,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#patchUri, [
                uri
              ], {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  void lock() => super.noSuchMethod(Invocation.method(#lock, []),
      returnValueForMissingStub: null);
  @override
  void unlock() => super.noSuchMethod(Invocation.method(#unlock, []),
      returnValueForMissingStub: null);
  @override
  void clear() => super.noSuchMethod(Invocation.method(#clear, []),
      returnValueForMissingStub: null);
  @override
  _i9.Future<_i6.Response<dynamic>> download(String? urlPath, dynamic savePath,
          {_i2.ProgressCallback? onReceiveProgress,
          Map<String, dynamic>? queryParameters,
          _i10.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i2.Options? options}) =>
      (super.noSuchMethod(
              Invocation.method(#download, [
                urlPath,
                savePath
              ], {
                #onReceiveProgress: onReceiveProgress,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options
              }),
              returnValue: Future<_i6.Response<dynamic>>.value(
                  _FakeResponse_4<dynamic>()))
          as _i9.Future<_i6.Response<dynamic>>);
  @override
  _i9.Future<_i6.Response<dynamic>> downloadUri(Uri? uri, dynamic savePath,
          {_i2.ProgressCallback? onReceiveProgress,
          _i10.CancelToken? cancelToken,
          bool? deleteOnError = true,
          String? lengthHeader = r'content-length',
          dynamic data,
          _i2.Options? options}) =>
      (super.noSuchMethod(
              Invocation.method(#downloadUri, [
                uri,
                savePath
              ], {
                #onReceiveProgress: onReceiveProgress,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options
              }),
              returnValue: Future<_i6.Response<dynamic>>.value(
                  _FakeResponse_4<dynamic>()))
          as _i9.Future<_i6.Response<dynamic>>);
  @override
  _i9.Future<_i6.Response<T>> request<T>(String? path,
          {dynamic data,
          Map<String, dynamic>? queryParameters,
          _i10.CancelToken? cancelToken,
          _i2.Options? options,
          _i2.ProgressCallback? onSendProgress,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#request, [
                path
              ], {
                #data: data,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> requestUri<T>(Uri? uri,
          {dynamic data,
          _i10.CancelToken? cancelToken,
          _i2.Options? options,
          _i2.ProgressCallback? onSendProgress,
          _i2.ProgressCallback? onReceiveProgress}) =>
      (super.noSuchMethod(
              Invocation.method(#requestUri, [
                uri
              ], {
                #data: data,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress
              }),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
  @override
  _i9.Future<_i6.Response<T>> fetch<T>(_i2.RequestOptions? requestOptions) =>
      (super.noSuchMethod(Invocation.method(#fetch, [requestOptions]),
              returnValue: Future<_i6.Response<T>>.value(_FakeResponse_4<T>()))
          as _i9.Future<_i6.Response<T>>);
}

/// A class which mocks [CryptoRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockCryptoRemoteDataSourceImpl extends _i1.Mock
    implements _i11.CryptoRemoteDataSourceImpl {
  MockCryptoRemoteDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i12.CoinsListResponse>> getCoinsList(
          _i13.CryptoRequest? request) =>
      (super.noSuchMethod(Invocation.method(#getCoinsList, [request]),
              returnValue: Future<List<_i12.CoinsListResponse>>.value(
                  <_i12.CoinsListResponse>[]))
          as _i9.Future<List<_i12.CoinsListResponse>>);
  @override
  _i9.Future<_i7.CoinResponse> getCoinById(
          String? selectedCoin, _i13.CryptoRequest? request) =>
      (super.noSuchMethod(
              Invocation.method(#getCoinById, [selectedCoin, request]),
              returnValue:
                  Future<_i7.CoinResponse>.value(_FakeCoinResponse_5()))
          as _i9.Future<_i7.CoinResponse>);
}

/// A class which mocks [CryptoRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCryptoRequest extends _i1.Mock implements _i13.CryptoRequest {
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

/// A class which mocks [CoinRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoinRequest extends _i1.Mock implements _i14.CoinRequest {
  MockCoinRequest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get localization =>
      (super.noSuchMethod(Invocation.getter(#localization), returnValue: '')
          as String);
  @override
  bool get tickers =>
      (super.noSuchMethod(Invocation.getter(#tickers), returnValue: false)
          as bool);
  @override
  bool get marketData =>
      (super.noSuchMethod(Invocation.getter(#marketData), returnValue: false)
          as bool);
  @override
  bool get communityData =>
      (super.noSuchMethod(Invocation.getter(#communityData), returnValue: false)
          as bool);
  @override
  bool get developerData =>
      (super.noSuchMethod(Invocation.getter(#developerData), returnValue: false)
          as bool);
  @override
  bool get sparkline =>
      (super.noSuchMethod(Invocation.getter(#sparkline), returnValue: false)
          as bool);
  @override
  List<Object?> get props =>
      (super.noSuchMethod(Invocation.getter(#props), returnValue: <Object?>[])
          as List<Object?>);
  @override
  Map<String, dynamic> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}

/// A class which mocks [CoinsListRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoinsListRequest extends _i1.Mock implements _i15.CoinsListRequest {
  MockCoinsListRequest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get includePlatform => (super
          .noSuchMethod(Invocation.getter(#includePlatform), returnValue: false)
      as bool);
  @override
  List<Object?> get props =>
      (super.noSuchMethod(Invocation.getter(#props), returnValue: <Object?>[])
          as List<Object?>);
  @override
  Map<String, bool> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []),
          returnValue: <String, bool>{}) as Map<String, bool>);
}
