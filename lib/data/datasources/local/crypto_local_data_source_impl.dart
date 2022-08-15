import 'package:crypto_tracker_app/core/error/exception.dart';
import 'package:crypto_tracker_app/data/datasources/local/crypto_local_data_source.dart';
import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/entities/community_data.dart';
import 'package:crypto_tracker_app/domain/entities/description.dart';
import 'package:crypto_tracker_app/domain/entities/developer_data.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';
import 'package:crypto_tracker_app/domain/entities/links.dart';
import 'package:crypto_tracker_app/domain/entities/platforms.dart';
import 'object_box_database.dart';
import 'package:crypto_tracker_app/objectbox.g.dart';

class CryptoLocalDataSourceImpl extends CryptoLocalDataSource {

  final ObjectBoxDatabase objectBoxDatabase;

  CryptoLocalDataSourceImpl({
    required this.objectBoxDatabase
  });

  @override
  Future<void> cacheCoin(List<dynamic> entitiesListToCache) async {
    final boxCoin = objectBoxDatabase.store.box<Coin>();
    final boxImage = objectBoxDatabase.store.box<Image>();
    final boxLinks = objectBoxDatabase.store.box<Links>();
    final boxDescription = objectBoxDatabase.store.box<Description>();
    final boxCommunityData = objectBoxDatabase.store.box<CommunityData>();
    final boxDeveloperData = objectBoxDatabase.store.box<DeveloperData>();
    final boxPlatforms = objectBoxDatabase.store.box<Platforms>();

    for (var entity in entitiesListToCache) {
      _addEntities(
          entity,
          boxCoin,
          boxImage,
          boxLinks,
          boxDescription,
          boxCommunityData,
          boxDeveloperData,
          boxPlatforms
      );
    }
  }

  @override
  Future<void> cacheCoinsList(List<CoinsList> coinsListToCache) async {
    final boxListCoins = objectBoxDatabase.store.box<CoinsList>();
    for (var coin in coinsListToCache) {
      boxListCoins.put(coin);
    }
  }

  @override
  Future<List<dynamic>> getLastCoin(String selectedCoin) async {
    final boxCoin = objectBoxDatabase.store.box<Coin>();
    final boxImage = objectBoxDatabase.store.box<Image>();
    final boxLinks = objectBoxDatabase.store.box<Links>();
    final boxDescription = objectBoxDatabase.store.box<Description>();
    final boxCommunityData = objectBoxDatabase.store.box<CommunityData>();
    final boxDeveloperData = objectBoxDatabase.store.box<DeveloperData>();
    final boxPlatforms = objectBoxDatabase.store.box<Platforms>();

    // final Query<Coin> queryCoin = (boxCoin.query(Coin_.coinId.equals(selectedCoin))).build();
    final Query<Coin> queryCoin = (boxCoin.query(Coin_.coinId.equals(selectedCoin))..order(Coin_.coinId, flags: Order.descending)).build();
    int idCoin = queryCoin.findFirst()!.id;

    final Query<Image> queryImage = (boxImage.query(Image_.id.equals(idCoin))).build();
    final Query<Links> queryLinks = (boxLinks.query(Links_.id.equals(idCoin))).build();
    final Query<Description> queryDescription = (boxDescription.query(Description_.id.equals(idCoin))).build();
    final Query<CommunityData> queryCommunityData = (boxCommunityData.query(CommunityData_.id.equals(idCoin))).build();
    final Query<DeveloperData> queryDeveloperData = (boxDeveloperData.query(DeveloperData_.id.equals(idCoin))).build();
    final Query<Platforms> queryPlatforms = (boxPlatforms.query(Platforms_.id.equals(idCoin))).build();

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
    } else {
      throw CacheException();
    }
    return entities;
  }

  @override
  Future<List<CoinsList>> getFavoritesCoinsList() async {
    final boxListCoins = objectBoxDatabase.store.box<CoinsList>();
    Query<CoinsList> queryCoinsList = (boxListCoins.query(CoinsList_.isFavorite.equals(true))).build();
    return queryCoinsList.find();
  }

  @override
  Future<List<CoinsList>> getLastCoinsList() async {
    final boxListCoins = objectBoxDatabase.store.box<CoinsList>();
    List<CoinsList> coinsList = boxListCoins.getAll();

    // final query  = (boxListCoins.query()..order(CoinsList_.coinId, flags: Order.descending)).build();
    // query.limit = 5;
    // QueryBuilder<CoinsList> query = _boxListCoins.query()..order(CoinsList_.symbol, flags: Order.descending);
    // List<CoinsList> coinsList = query.build();
    // final coinsList = query.find();

    // TODO: Handling new list
    // List<CoinsList> topFive = [];
    // print(coinsList.length); 563509
    // if (coinsList.length >= 20) {

    //   coinsList.sort((a, b) {
    //     return a.coinId.toLowerCase().compareTo(b.coinId.toLowerCase());
    //   });
    //   topFive = coinsList.take(15).toList();
    //   topFive.sort((a, b) {
    //     return a.coinId.toLowerCase().compareTo(b.coinId.toLowerCase());
    //   });

    // } else {
    //   // if you length is not greater than 5 then you have your top automatically.
    //   topFive = coinsList;
    // }

    // return topFive.isEmpty ? throw CacheException() : topFive;
    return coinsList.isEmpty ? throw CacheException() : coinsList;
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
        throw CacheException();
      }
    }
  }

  @override
  Future<int> getCoinsFavoritesNumbers() async {
    final boxCoin = objectBoxDatabase.store.box<Coin>();
    final Query<Coin> queryCoin = (boxCoin.query(Coin_.isFavorite.equals(true))..order(Coin_.coinId, flags: Order.descending)).build();
    // print(queryCoin.count());
    if (queryCoin.findFirst() != null) {
      return queryCoin.count();
    } else {
      return 0;
    }
    // return 1;
  }

  @override
  Future<bool> updateFavorites(String selectedCoin) async {
    final boxCoin = objectBoxDatabase.store.box<Coin>();
    // final Query<Coin> queryCoin = (boxCoin.query(
    //     Coin_.coinId.notNull() &
    //     Coin_.coinId.equals(selectedCoin)
    // )).build();
    final queryCoin = (boxCoin.query(Coin_.coinId.notNull().and(Coin_.coinId.equals(selectedCoin))).build());
    final coin = queryCoin.findFirst();

    if (coin != null) {
      coin.isFavorite = !coin.isFavorite;
      boxCoin.put(coin);
      return coin.isFavorite;
    }
    throw ServerException();
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