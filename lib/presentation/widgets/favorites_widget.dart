import 'package:crypto_tracker_app/domain/entities/coins_list.dart';
import 'package:crypto_tracker_app/presentation/viewmodel/favorites_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/app_provider.dart';
import '../../core/providers/coin_provider.dart';

// class FavoritesWidget extends ConsumerStatefulWidget {
//   const FavoritesWidget(String coinName, bool coinIsFavorite, {Key? key}) : super(key: key);
//
//   @override
//   FavoritesWidgetState createState() => FavoritesWidgetState();
// }
class FavoritesWidget extends ConsumerWidget {
  final CoinsList coin;
  const FavoritesWidget(this.coin, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isFavorite = false;
    // int favoriteCount = 42;
    // return ListTile(
    //   title: Text(coin.coinId),
    //   trailing: IconButton(
    //     icon: coin.isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
    //     color: Colors.red,
    //     // onPressed: _toggleFavorite,
    //     onPressed: () {
    //       coin.toggleFavorite(ref);
    //     },
    //   ),
    // );

    return Row(
      children: [
        IconButton(
          icon: coin.isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
          color: Colors.red,
          // onPressed: _toggleFavorite,
          onPressed: () {
            coin.toggleFavorite(ref);
          },
        ),
        // Text('$favoriteCount')
      ],
    );
  }
}

// class FavoritesWidget extends ConsumerStatefulWidget {
//   const FavoritesWidget(String coinName, bool coinIsFavorite, {Key? key}) : super(key: key);
//
//   @override
//   FavoritesWidgetState createState() => FavoritesWidgetState();
// }
// class FavoritesWidgetState extends ConsumerState<FavoritesWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     bool isFavorite = false;
//     int favoriteCount = 42;
//     return Row(
//       children: [
//         Consumer(
//           builder: (BuildContext context, WidgetRef ref, Widget? child) {
//             return IconButton(
//               icon: isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
//               color: Colors.red,
//               // onPressed: _toggleFavorite,
//               onPressed: () {
//                 ref.read(updateFavoritesController);
//               },
//             );
//           }
//         ),
//         Text('$favoriteCount')
//       ],
//     );
//   }
//
// }




// class FavoritesWidget extends StatefulWidget {
//   final bool isFavorite;
//   final int favoriteCount;
//
//   const FavoritesWidget({Key? key, required this.isFavorite, required this.favoriteCount}) : super(key: key);
//
//   @override
//   State<FavoritesWidget> createState() => _FavoritesWidgetState(isFavorite, favoriteCount);
// }
//
// class _FavoritesWidgetState extends State<FavoritesWidget> {
//   bool _isFavorite;
//   int _favoriteCount;
//
//   _FavoritesWidgetState(this._isFavorite, this._favoriteCount);
//
//   void _toggleFavorite() {
//     setState(() {
//       if (_isFavorite) {
//         _isFavorite = false;
//         _favoriteCount -= 1;
//       } else {
//         _isFavorite = true;
//         _favoriteCount += 1;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           icon: _isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
//           color: Colors.red,
//           // onPressed: _toggleFavorite,
//           onPressed: () {
//             context.read(updateFavoritesController);
//           },
//         ),
//         Text('$_favoriteCount')
//       ],
//     );
//   }
// }
