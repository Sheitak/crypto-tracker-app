import 'package:crypto_tracker_app/core/network/network_info.dart';
import 'package:crypto_tracker_app/core/network/network_info_impl.dart';
import 'package:crypto_tracker_app/core/util/data_type_converter.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source_impl.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart';
import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source_impl.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final objectBoxDatabaseProvider = Provider<ObjectBoxDatabase>((ref) => throw UnimplementedError());

final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl(
    InternetConnectionChecker()
));

final cryptoRemoteDataSourceProvider = Provider<CryptoRemoteDataSource>((ref) => CryptoRemoteDataSourceImpl());

final cryptoLocalDataSourceProvider = Provider<CryptoLocalDataSource>((ref) => CryptoLocalDataSourceImpl(
    objectBoxDatabase: ref.read(objectBoxDatabaseProvider)
));