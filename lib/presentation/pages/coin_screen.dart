import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_tracker_app/core/error/failures.dart';
import 'package:crypto_tracker_app/core/util/data_type_converter.dart';
import 'package:crypto_tracker_app/core/providers/coin_provider.dart';
import 'package:crypto_tracker_app/presentation/widgets/favorites_widget.dart';
import 'package:flutter/material.dart';
import 'package:crypto_tracker_app/presentation/widgets/custom_icons.dart';
import 'package:crypto_tracker_app/presentation/widgets/custom_text.dart';
import 'package:crypto_tracker_app/presentation/widgets/error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../viewmodel/favorites_screen_controller.dart';

class CoinScreen extends StatelessWidget {
  final String selectedCoin;
  const CoinScreen({Key? key, required this.selectedCoin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Crypto Tracker App'),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(CustomIcons.pager),
                  text: 'Profile',
                ),
                Tab(
                  icon: Icon(CustomIcons.chartLine),
                  text: 'Graphic',
                ),
                Tab(
                  icon: Icon(CustomIcons.rocketChat),
                  text: 'Chat',
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => {
                  Navigator.pushNamed(context, '/wallet')
                },
                icon: const Icon(Icons.account_balance_wallet_outlined),
              )
            ],
          ),
          body: TabBarView(
            children: [
              _buildProfileCoin(),
              Center(
                  child: Image.asset(
                    'assets/images/people-tech.png',
                    fit: BoxFit.cover,
                  )
              ),
              Center(
                  child: Image.asset(
                    'assets/images/people-tech.png',
                    fit: BoxFit.cover,
                  )
              ),
            ],
          ),
        ));
  }

  Widget _buildProfileCoin() {
    return Consumer(builder: (BuildContext context, WidgetRef ref, child) {
      return ref.watch(coinViewModelProvider(selectedCoin)).when(
          data: (either) {
            return either.fold(
                (failure) => throw const StandardFailure(
                    code: 404,
                    message: ''
                ),
                (coin) => Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Hero(
                                      tag: 'imageCoin ${coin[0].coinId}',
                                      // tag: "imageCoin" + (coin.isNotEmpty ? coin[0].coinId : ''),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        // child: Image.network(
                                        //   // coin[1].large,
                                        //   (coin.isNotEmpty ? coin[1].large : 'https://picsum.photos/200/200'),
                                        //   width: 125,
                                        //   fit: BoxFit.cover,
                                        // ),
                                        child: CachedNetworkImage(
                                          // coin[1].large,
                                          // imageUrl: (coin.isNotEmpty ? coin[1].large : 'https://picsum.photos/200/200'),
                                          imageUrl: coin[1].large,
                                          placeholder: (context, url) => const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => const Icon(
                                              Icons.error
                                          ),
                                          width: 125,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.height / 3,
                                          child: CustomTitleSection(coin[0].coinId)
                                        ),
                                        Container(height: 10),
                                        CustomCryptoText(
                                            'Ticker : ${coin[0].symbol.toUpperCase()}'
                                        ),
                                        CustomCryptoText(
                                            'Algorithm : ${coin[0].algorithm}'
                                        ),
                                        CustomCryptoText(
                                            'Block Time : ${coin[0].blockTimeInMinutes}'
                                        ),
                                        Row(
                                          children: [
                                            CustomCryptoText('Categories : '),
                                            for (var category in coin[0].categories)
                                              Text(category + ' '),
                                          ],
                                        ),
                                        CustomCryptoText(
                                            'Platforms : Moonriver ${coin[6].moonriver}'
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 5.0, bottom: 5.0
                                          ),
                                          child: CustomTitleSection(
                                            'Last Updated : ${DateFormat.yMMMd()
                                                .add_jm()
                                                .format(coin[0].lastUpdated
                                            )}',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.0, left: 5.0, bottom: 5.0
                                      ),
                                      // child: FavoritesWidget(
                                      //     isFavorite: false,
                                      //     favoriteCount: 44
                                      // ),
                                    // child: FavoritesWidget(),
                                    child: Center(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      coin[3].en,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildButtonLinkColumn(
                                    Colors.blue,
                                    CustomIcons.at,
                                    "WEBSITE"
                                ),
                                _buildButtonLinkColumn(
                                    Colors.blue,
                                    CustomIcons.link,
                                    "EXPLORER"
                                ),
                                _buildButtonLinkColumn(
                                    Colors.blue,
                                    CustomIcons.reddit,
                                    "REDDIT"
                                ),
                                _buildButtonLinkColumn(
                                    Colors.blue,
                                    CustomIcons.github,
                                    "GITHUB"
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Card(
                            elevation: 3.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTitleSection('Global Information\'s'),
                                  Container(height: 10.0),
                                  CustomCryptoText(
                                      'Genesis Date : ${coin[0].genesisDate}'
                                  ),
                                  CustomCryptoText(
                                      'Market Cap Rank : ${coin[0].marketCapRank}'
                                  ),
                                  CustomCryptoText(
                                      'CoinGecko Rank : ${coin[0].coinGeckoRank}'
                                  ),
                                  Container(height: 10.0),
                                  CustomCryptoText(
                                      'CoinGecko Score : ${coin[0].coinGeckoScore} %'
                                  ),
                                  CustomCryptoText(
                                      'Developer Score : ${coin[0].developerScore} %'
                                  ),
                                  CustomCryptoText(
                                      'Community Score : ${coin[0].communityScore} %'
                                  ),
                                  CustomCryptoText(
                                      'Liquidity Score : ${coin[0].liquidityScore} %'
                                  ),
                                  CustomCryptoText(
                                      'Public Interest Score : ${coin[0].publicInterestScore} %'
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Card(
                            elevation: 3.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTitleSection(
                                      'Community Information\'s'
                                  ),
                                  Container(height: 10.0),
                                  CustomCryptoText(
                                      'Facebook Like : ${coin[4].facebookLikes}'
                                  ),
                                  CustomCryptoText(
                                      'Twitter Followers : ${coin[4].twitterFollowers}'
                                  ),
                                  CustomCryptoText(
                                      'Reddit Accounts Posts (48h) : ${coin[4].redditAveragePosts48h}'
                                  ),
                                  CustomCryptoText(
                                      'Reddit Accounts Comments (48h) : ${coin[4].redditAverageComments48h}'
                                  ),
                                  CustomCryptoText(
                                      'Reddit Accounts Active (48h) : ${coin[4].redditAccountsActive48h}'
                                  ),
                                  CustomCryptoText(
                                      'Reddit Subscribers : ${coin[4].redditSubscribers}'
                                  ),
                                  CustomCryptoText(
                                      'Telegram Channel Users : ${coin[4].telegramChannelUserCount}'
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Card(
                            elevation: 3.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTitleSection(
                                      'Developer Data\'s'
                                  ),
                                  Container(height: 10.0),
                                  CustomCryptoText(
                                      'Forks : ${coin[5].forks}'
                                  ),
                                  CustomCryptoText(
                                      'CodeAdditionsDel : ${coin[5].codeAdditionsDeletions4Weeks}'
                                    // TODO: Exemple du convertisseur de données en sortie sur la couche de présentation, avec Either.
                                    //   'CodeAdditionsDel : ${dataTypeConverter.stringToMapConvert(coin[5].codeAdditionsDeletions4Weeks).fold((l) => '', (r) => r['additions'])}'
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                )
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Error(message: error.toString(), callback: () => {})
      );
    });
  }

  Column _buildButtonLinkColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Icon(icon, color: color, size: 22)),
        Text(label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            )
        )
      ],
    );
  }
}
