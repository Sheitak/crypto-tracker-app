import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/providers/coin_provider.dart';
import 'package:crypto_tracker_app/core/providers/coins_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:crypto_tracker_app/presentation/widgets/error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              icon: const Icon(
                  Icons.account_balance_wallet_outlined
              ),
            )
          ],
        ),
        backgroundColor: Colors.blueGrey[500],
        drawer: _buildDrawerWidget(),
        body: const _BuildBodyListCoinsWidget());
  }
}

Widget _buildDrawerWidget() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.indigo,
          ),
          child: Text(
            'My Cryptocurrencies',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('Favoris'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
        ListTile(
          leading: Icon(Icons.ten_k_rounded),
          title: Text('About'),
        ),
      ],
    ),
  );
}

class _BuildBodyListCoinsWidget extends ConsumerWidget {
  const _BuildBodyListCoinsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(coinsListViewModelProvider).when(
        data: (either) {
          return either.fold(
              (failure) => throw const StandardFailure(
                code: 404,
                message: ''
              ),
              (coinsList) => ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            if (coinsList.isEmpty) {
                              return Error(
                                  message: 'No Cryptocurrencies found',
                                  callback: () => {}
                                  );
                            }
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/cryptocurrencies',
                                    arguments: coinsList[index].coinId);
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
                                                (failure) => throw const StandardFailure(
                                                    code: 404,
                                                    message: ''
                                                ),
                                                (coin) => Hero(
                                                  tag: "imageCoin" + coin[0].coinId,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl: coin[1].small,
                                                        placeholder: (context, url) => const CircularProgressIndicator(),
                                                        errorWidget: (context, url, error) => const Icon(
                                                            Icons.error
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  )
                                              );
                                            },
                                            loading: () => const Center(child: CircularProgressIndicator()),
                                            error: (error, _) => Error(message: error.toString(), callback: () => {})
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(bottom: 8.0),
                                                child: Text(
                                                  coinsList[index].coinId.toUpperCase(),
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                coinsList[index].symbol.toUpperCase(),
                                                style: TextStyle(
                                                    color: Colors.grey[500],
                                                    fontSize: 14
                                                ),
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
                          },
                        )
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Error(message: error.toString(), callback: () => {})
    );
  }
}
