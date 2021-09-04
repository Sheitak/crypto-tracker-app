import 'package:crypto_tracker_app/core/providers/coin_provider.dart';
import 'package:crypto_tracker_app/presentation/widgets/custom_icons.dart';
import 'package:crypto_tracker_app/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto_tracker_app/presentation/widgets/error.dart';

class CoinScreen extends StatelessWidget {
  final String selectedCoin;

  CoinScreen(this.selectedCoin);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Crypto Tracker App'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  // icon: Icon(Icons.article_outlined),
                  icon: Icon(CustomIcons.pager),
                  text: 'Profile',
                ),
                Tab(
                  icon: Icon(CustomIcons.chart_line),
                  text: 'Graphic',
                ),
                Tab(
                  icon: Icon(CustomIcons.rocketchat),
                  text: 'Chat',
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => {
                  Navigator.pushNamed(context, '/wallet')
                },
                icon: Icon(Icons.account_balance_wallet_outlined),
              )
            ],
          ),
          body: TabBarView (
            children: [
              _buildProfileCoin(),
              Center(child: Text("Example 2 : Graphic ?")),
              Center(child: Text("Example 3 : Chat Room ?"))
            ],
          ),
        )
    );
  }

  Widget _buildProfileCoin() {
    return Container(
        child: Consumer(builder: (BuildContext context, watch, child) {
          return watch(coinViewModelProvider(selectedCoin)).when(
              data: (coin) {
                return Padding(
                    padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Hero(
                                  tag: "imageCoin" + '${coin.id}',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      '${coin.image.large}',
                                      width: 150,
                                      // height: 240,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomCryptoText('${coin.id}'),
                                    Container(height: 10),
                                    CustomCryptoText('Ticker : ${coin.symbol.toUpperCase()}'),
                                    CustomCryptoText('Algorithm : ${coin.algorithm}'),
                                    CustomCryptoText('Block Time : ${coin.blockTimeInMinutes}',
                                    ),
                                    CustomCryptoText(
                                      'Categories : ${coin.categories}',
                                    ),
                                    CustomCryptoText('Platforms : ${coin.platforms}'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                child: CustomCryptoText('Last Updated : ${coin.symbol}'),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      '${coin.description['en']}',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            _buildButtonLinkColumn(Colors.blue, CustomIcons.at, "WEBSITE"),
                            _buildButtonLinkColumn(Colors.blue, CustomIcons.link, "EXPLORER"),
                            _buildButtonLinkColumn(Colors.blue, CustomIcons.reddit, "REDDIT"),
                            _buildButtonLinkColumn(Colors.blue, CustomIcons.github, "GITHUB")
                          ]),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Card(
                            elevation: 2.0,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomCryptoText('Genesis Date : ${coin.genesisDate}'),
                                  CustomCryptoText('Market Cap Rank : ${coin.marketCapRank}'),
                                  CustomCryptoText('CoinGecko Rank : ${coin.coinGeckoRank}'),
                                  Container(height: 10.0),
                                  CustomCryptoText('CoinGecko Score : ${coin.coinGeckoScore}'),
                                  CustomCryptoText('Developer Score : ${coin.developerScore}'),
                                  CustomCryptoText('Community Score : ${coin.communityScore}'),
                                  CustomCryptoText('Liquidity Score : ${coin.liquidityScore}'),
                                  CustomCryptoText('Public Interest Score : ${coin.publicInterestScore}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Card(
                            elevation: 2.0,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomCryptoText('Facebook Like : ${coin.communityData['facebook_likes']}'),
                                  CustomCryptoText('Twitter Followers : ${coin.communityData['twitter_followers']}'),
                                ],
                              ),
                            ),
                          ),
                        ),



                        new Text('${coin.links.subredditUrl}'),
                        new Text('${coin.communityData}'),
                      ],
                    ));
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) =>
                  Error(message: error.toString(), callback: () => {}));
        })
    );
  }

  Column _buildButtonLinkColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Icon(
                icon,
                color: color,
                size: 22
            )
        ),
        Text(
            label,
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
