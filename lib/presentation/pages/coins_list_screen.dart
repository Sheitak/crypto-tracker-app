import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/providers/coin_provider.dart';
import 'package:crypto_tracker_app/core/providers/coins_list_provider.dart';
import 'package:crypto_tracker_app/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:crypto_tracker_app/presentation/widgets/error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/app_provider.dart';
import '../widgets/favorites_widget.dart';

class CoinsListScreen extends StatelessWidget {
  const CoinsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Tracker App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.pushNamed(context, '/wallet')
              },
              icon: const Icon(Icons.account_balance_wallet_outlined),
            )
          ],
        ),
        backgroundColor: Colors.blueGrey[500],
        drawer: DrawerWidget(context),
        // drawer: _buildDrawerWidget(context),
        // body: const _BuildBodyListCoinsWidget()
        body: const CustomScrollView(
          slivers: [
            _BuildBodyListCoinsWidget()
          ],
        )
    );
  }
}

class _BuildBodyListCoinsWidget extends ConsumerWidget {
  const _BuildBodyListCoinsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // https://www.freecodecamp.org/news/infinite-pagination-in-flutter-with-riverpod/
    return ref.watch(coinsListViewModelProvider).when(
        data: (either) {
          return either.fold(
              (failure) => throw const StandardFailure(
                  code: 404,
                  message: 'Failure : No cryptocurrencies available'),
              (coinsList) => SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      if (coinsList.isEmpty) {
                        return Error(
                            message: 'No Cryptocurrencies found',
                            callback: () => {});
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/cryptocurrency',
                              arguments: coinsList[index].coinId
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.all(0.6),
                          elevation: 8.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ref.watch(coinViewModelProvider(coinsList[index].coinId)).when(
                                          data: (either) {
                                            return either.fold(
                                                (failure) =>
                                                    throw const StandardFailure(
                                                        code: 404, message: ''),
                                                (coin) => Hero(
                                                      tag: 'imageCoin ${coin[0].coinId}',
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(5.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              coin[1].small,
                                                          placeholder: (context,
                                                                  url) =>
                                                              const CircularProgressIndicator(),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ));
                                          },
                                          loading: () => const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          error: (error, _) => Error(
                                              message: error.toString(),
                                              callback: () => {})
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            coinsList[index].coinId.toUpperCase(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              coinsList[index].symbol.toUpperCase(),
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 14
                                              ),
                                            ),
                                            // Padding(
                                            //     padding: const EdgeInsets.only(
                                            //         top: 0, left: 0, bottom: 0
                                            //     ),
                                            //     child: FavoritesWidget(coinsList[index])
                                            // )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }, childCount: 20
                    // }, childCount: coinsList.length
                    ),
                  ));
        },
        loading: () => const SliverToBoxAdapter(
            child: Center(
                child: CircularProgressIndicator()
            )
        ),
        error: (error, _) =>
            Error(message: error.toString(), callback: () => {})
    );
  }
}
