import 'package:crypto_tracker_app/domain/usecases/usecase.dart';
import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/providers/app_provider.dart';
import '../../core/providers/coin_provider.dart';
import '../../core/providers/coins_list_provider.dart';
import '../../domain/repositories/coin_repository.dart';

final updateFavoritesController = StateNotifierProvider<FavoritesScreenController, List<CoinsList>>((ref) {
  return FavoritesScreenController();
  // return FavoritesScreenController(ref.read(coinsListViewModelProvider));
});

// class FavoritesScreenController extends StateNotifier<AsyncValue<String>> {
class FavoritesScreenController extends StateNotifier<List<CoinsList>> {
  FavoritesScreenController() : super([]);
  // FavoritesScreenController(this.coinsListViewModelProvider) : super([]);
  // final List<CoinsList> coinsListViewModelProvider;

  // // Permettre à l'interface utilisateur d'ajouter des todos.
  // void addCoinsList(CoinsList coinsList) {
  //   // Comme notre état est immuable, nous n'avons pas le droit de faire `state.add(todo)`.
  //   // Au lieu de cela, on doit créer une nouvelle liste de tâches qui contient
  //   // les éléments précédents et le nouveau.
  //   // L'utilisation de spread de Dart est utile ici !
  //   state = [...state, coinsList];
  //   // Il n'est pas nécessaire d'appeler "notifyListeners" ou quelque chose de similaire.
  //   // L'appel à "state =" reconstruira automatiquement l'interface utilisateur si nécessaire.
  // }
  // // Autorisation de supprimer les todos
  // void removeCoinsList(String coinsListId) {
  //   // Encore une fois, notre état est immuable.
  //   // Donc on crée une nouvelle liste au lieu de changer la liste existante.
  //   state = [
  //     for (final coinsList in state)
  //       if (coinsList.coinId != coinsListId) coinsList,
  //   ];
  // }
  // // Marquez une tâche comme étant terminée
  // void toggleCoinsList(String coinsListId, bool isFavorite) {
  //   state = [
  //     for (final coinsList in state)
  //     // on marque seulement le todo correspondant comme terminé
  //       if (coinsList.coinId == coinsListId)
  //       // Encore une fois, puisque notre état est immuable,
  //       // nous devons faire une copie du todo. Nous utilisons la méthode `copyWith`
  //       // implémentée précédemment pour y parvenir.
  //         coinsList.copyWith(isFavorite: isFavorite)
  //       else
  //       // les autres todos ne sont pas modifiés
  //         coinsList,
  //   ];
  // }

  Future<void> updateFavorites(String coinId, bool isFavorite) async {
    var newState = state.map((coin) {
        // if p is the intended product,
        // update its isFavorite value
        if (coin.coinId == coinId) {
          return coin.copyWith(isFavorite: isFavorite);
        } else {
          return coin;
        }
      },
    ).toList();
    // we cant just do state[index].isFavorite = isFavorite,
    // bcz that would not trigger the state change,
    // so we have to do somethings like state = ...
    state = newState;
  }
}
