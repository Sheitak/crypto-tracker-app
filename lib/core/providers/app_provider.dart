import 'package:crypto_tracker_app/core/network/network_info.dart';
import 'package:crypto_tracker_app/core/network/network_info_impl.dart';
import 'package:crypto_tracker_app/core/util/data_type_converter.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source_impl.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart';
import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/data/datasources/remote/cloud_firestore_database.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source_impl.dart';
import 'package:crypto_tracker_app/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../data/datasources/remote/firebase_authentication.dart';
import '../../firebase_options.dart';

final objectBoxDatabaseProvider = Provider<ObjectBoxDatabase>((ref) => throw UnimplementedError());

// final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
//   return await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform
//   );
// });

final firebaseAuthenticationProvider = Provider<FirebaseAuthentication>((ref) => FirebaseAuthentication());

final cloudFirestoreDatabaseProvider = Provider<CloudFirestoreDatabase>((ref) => CloudFirestoreDatabase());

final authStateProvider = StreamProvider<User?>((ref) => ref.read(firebaseAuthenticationProvider).authStateChange);

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl(
    InternetConnectionChecker()
));

final cryptoRemoteDataSourceProvider = Provider<CryptoRemoteDataSource>((ref) => CryptoRemoteDataSourceImpl());

final cryptoLocalDataSourceProvider = Provider<CryptoLocalDataSource>((ref) => CryptoLocalDataSourceImpl(
    objectBoxDatabase: ref.read(objectBoxDatabaseProvider)
));