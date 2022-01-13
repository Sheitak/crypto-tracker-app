import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/data/datasources/local/object_box_database.dart';
import 'package:crypto_tracker_app/data/datasources/remote/coin_remote_api.dart';
import 'package:crypto_tracker_app/data/models/request/coin_request.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/entities/community_data.dart';
import 'package:crypto_tracker_app/domain/entities/description.dart';
import 'package:crypto_tracker_app/domain/entities/developer_data.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';
import 'package:crypto_tracker_app/domain/entities/links.dart';
import 'package:crypto_tracker_app/domain/entities/platforms.dart';
import 'package:crypto_tracker_app/domain/repositories/coin_repository.dart';
import 'package:crypto_tracker_app/objectbox.g.dart';
import 'package:dartz/dartz.dart';

class CoinRepositoryImpl extends CoinRepository {

  final CoinRemoteApi _remoteApi;
  final ObjectBoxDatabase _objectBoxDatabase;

  CoinRepositoryImpl(
      this._remoteApi,
      this._objectBoxDatabase
  );

  @override
  Future<Either<FailureR, List>> getCoinById(selectedCoin) async {

    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    final _boxCoin = _objectBoxDatabase.store.box<Coin>();
    final _boxImage = _objectBoxDatabase.store.box<Image>();
    final _boxLinks = _objectBoxDatabase.store.box<Links>();
    final _boxDescription = _objectBoxDatabase.store.box<Description>();
    final _boxCommunityData = _objectBoxDatabase.store.box<CommunityData>();
    final _boxDeveloperData = _objectBoxDatabase.store.box<DeveloperData>();
    final _boxPlatforms = _objectBoxDatabase.store.box<Platforms>();

    if (connectivityResult != ConnectivityResult.none) {
      final entitiesList = await getRemoteDataCoin(selectedCoin);

      for (var entity in entitiesList) {
        _addEntities(
            entity,
            _boxCoin,
            _boxImage,
            _boxLinks,
            _boxDescription,
            _boxCommunityData,
            _boxDeveloperData,
            _boxPlatforms
        );
      }
    }

    //---------------------------------
    // https://objectbox.io/dart-flutter-database-1_0-release/
    //     // 2. variante : "surveillez" la base de données pour tout changement dans l'entité, puis réexécutez la requête
    //     Stream<Query<Person>> watchedQuery = query.watch();
    //     Vous pouvez ensuite .listen(), ou par exemple ajouter la requête à un StreamBuilder pour l'afficher sur l'interface utilisateur.
    //     _controller.addStream(watchedQuery.map((Query<Person> q) => q.find()));

    //     for (int i = 0; i < 100; i++) {
    //       box.putQueued(Person(...));
    //     }
    //     store.awaitAsyncSubmitted();
    //     after `awaitAsync*`: objects are inserted
    //     expect(box.count(), equals(100));

    // final Query<Coin> queryCoin = (
    //   _boxCoin.query(Coin_.coinId.equals(selectedCoin))
    //   ..order(Coin_.coinId, flags: Order.descending | Order.caseSensitive)
    // ).build();
    //---------------------------------

    final Query<Coin> queryCoin = (_boxCoin.query(Coin_.coinId.equals(selectedCoin))).build();
    int idCoin = queryCoin.findFirst()!.id;

    final Query<Image> queryImage = (_boxImage.query(Image_.id.equals(idCoin))).build();
    final Query<Links> queryLinks = (_boxLinks.query(Links_.id.equals(idCoin))).build();
    final Query<Description> queryDescription = (_boxDescription.query(Description_.id.equals(idCoin))).build();
    final Query<CommunityData> queryCommunityData = (_boxCommunityData.query(CommunityData_.id.equals(idCoin))).build();
    final Query<DeveloperData> queryDeveloperData = (_boxDeveloperData.query(DeveloperData_.id.equals(idCoin))).build();
    final Query<Platforms> queryPlatforms = (_boxPlatforms.query(Platforms_.id.equals(idCoin))).build();

    List<dynamic> entities = [];
    if (queryCoin.findFirst() != null &&
        queryImage.findFirst() != null &&
        queryLinks.findFirst() != null &&
        queryDescription.findFirst() != null &&
        queryCommunityData.findFirst() != null &&
        queryDeveloperData.findFirst() != null &&
        queryPlatforms.findFirst() != null
    ) {
      entities.add(queryCoin.findFirst());
      entities.add(queryImage.findFirst());
      entities.add(queryLinks.findFirst());
      entities.add(queryDescription.findFirst());
      entities.add(queryCommunityData.findFirst());
      entities.add(queryDeveloperData.findFirst());
      entities.add(queryPlatforms.findFirst());
    }
    if (connectivityResult == ConnectivityResult.none &&
        queryCoin.findFirst() == null &&
        queryImage.findFirst() == null &&
        queryLinks.findFirst() == null &&
        queryDescription.findFirst() == null &&
        queryCommunityData.findFirst() == null &&
        queryDeveloperData.findFirst() == null &&
        queryPlatforms.findFirst() == null
    ) {
      return Left(
          throw const Failure()
      );
      // return throw Exception('ERROR : YOU MUST BE CONNECTED TO INTERNET FOR YOUR FIRST USE. PLEASE CHECK YOUR CONNECTION.');
    }


    //---------------------------------
    // final _boxImage = _objectBoxDatabase.store.box<Image>();
    // ordersQueryBuilder.link(Order_.item, Item_.price < 100).link(Item_.category, Category_.id.equals(id)); >>
    // ordersQueryBuilder.link(Order_.item, Item_.category.equals(id).and(Item_.price < 100))

    // final Query<Coin> test = (_boxCoin.query(Coin_.coinId.equals("01coin"))).build();
    // print(test.findUnique());
    // final test = _objectBoxDatabase.store.box<Coin>().query(Coin_.coinId.equals("01coin"))
    //   ..link(Coin_.image, Image_.coin.equals(4))
    //   ..build();
    // print(test.toString());

    // final Query<Coin> test = _boxCoin.query(Coin_.coinId.equals("01coin")).link(Coin_.image, Image_.coin.equals(8));

    // final QueryBuilder<Coin> builder = _boxCoin.query(Coin_.coinId.equals("01coin"));
    // builder.link(Coin_.image, Image_.coin.equals((Coin_.id) as int));
    // var query3 = builder.build();
    // print(query3.findFirst());
    //---------------------------------------

    return Right(entities);
  }

  Future<void> _addEntities(
      entity,
      Box<Coin> boxCoin,
      Box<Image> boxImage,
      Box<Links> boxLinks,
      Box<Description> boxDescription,
      Box<CommunityData> boxCommunityData,
      Box<DeveloperData> boxDeveloperData,
      Box<Platforms> boxPlatforms
  ) async {
    switch (entity.runtimeType) {
      case Coin: {
        boxCoin.put(entity);
      }
      break;
      case Image: {
        boxImage.put(entity);
      }
      break;
      case Links: {
        boxLinks.put(entity);
      }
      break;
      case Description: {
        boxDescription.put(entity);
      }
      break;
      case CommunityData: {
        boxCommunityData.put(entity);
      }
      break;
      case DeveloperData: {
        boxDeveloperData.put(entity);
      }
      break;
      case Platforms: {
        boxPlatforms.put(entity);
      }
      break;
      default: {
        throw Exception('ERROR : NO MATCHING TYPE FOUND');
      }
    }
  }

  Future<List> getRemoteDataCoin(selectedCoin) async {
    return await _remoteApi.getCoinById(
        selectedCoin,
        const CoinRequest(
            localization: 'false',
            tickers: false,
            marketData: false,
            communityData: true,
            developerData: false,
            sparkline: false
        )
    ).then(
        (value) => value.toEntities()
    );
  }
}