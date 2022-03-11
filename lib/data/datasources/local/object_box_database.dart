import 'package:crypto_tracker_app/domain/entities/coin.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/domain/entities/community_data.dart';
import 'package:crypto_tracker_app/domain/entities/description.dart';
import 'package:crypto_tracker_app/domain/entities/developer_data.dart';
import 'package:crypto_tracker_app/domain/entities/image.dart';
import 'package:crypto_tracker_app/domain/entities/links.dart';
import 'package:crypto_tracker_app/domain/entities/platforms.dart';
import 'package:crypto_tracker_app/objectbox.g.dart';

class ObjectBoxDatabase {
  late final Store store;
  late final Box<CoinsList> _boxListCoin;
  late final Box<Coin> _boxCoin;
  late final Box<Image> _boxImage;
  late final Box<Links> _boxLinks;
  late final Box<Description> _boxDescription;
  late final Box<CommunityData> _boxCommunityData;
  late final Box<DeveloperData> _boxDeveloperData;
  late final Box<Platforms> _boxPlatforms;

  // Ajoutez tout le code de configuration supplémentaire, par ex. construire des requêtes.
  ObjectBoxDatabase._create(this.store) {
    _boxListCoin = Box<CoinsList>(store);
    _boxCoin = Box<Coin>(store);
    _boxImage = Box<Image>(store);
    _boxLinks = Box<Links>(store);
    _boxDescription = Box<Description>(store);
    _boxCommunityData = Box<CommunityData>(store);
    _boxDeveloperData = Box<DeveloperData>(store);
    _boxPlatforms = Box<Platforms>(store);
  }

  // Créez une instance d'ObjectBox à utiliser dans toute l'application.
  static Future<ObjectBoxDatabase> initialization() async {
    final store = await openStore();
    return ObjectBoxDatabase._create(store);
  }
}