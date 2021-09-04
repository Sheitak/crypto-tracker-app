import 'package:crypto_tracker_app/core/providers/coin_provider.dart';
import 'package:crypto_tracker_app/core/providers/coins_list_provider.dart';
import 'package:crypto_tracker_app/presentation/widgets/custom_text.dart';
import 'package:crypto_tracker_app/presentation/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CoinsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crypto Tracker App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => {Navigator.pushNamed(context, '/wallet')},
              icon: Icon(Icons.account_balance_wallet_outlined),
            )
          ],
        ),
        backgroundColor: Colors.blueGrey[50],
        drawer: _buildDrawerWidget(),
        body: _BuildBodyListCoinsWidget()
    );
  }
}

Widget _buildDrawerWidget() {
  return new Drawer(
    child: new Container(
      color: Color(0xffCFD8DC),
      child: new ListView.builder(
          itemCount: 5,
          itemBuilder: (context, i) {
            if (i == 0) {
              return DrawerHeader(
                  child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new CustomButtonText(
                    "My Cryptocurrencies",
                    fontSize: 22.0,
                  ),
                ],
              ));
            } else if (i == 1) {
              return new ListTile(
                title: new CustomButtonText('Test'),
                onTap: () {},
              );
            } else {
              return new ListTile(
                title: new CustomButtonText('Test'),
                trailing: new IconButton(
                    onPressed: () => {},
                    icon: new Icon(Icons.delete, color: Colors.white)),
                onTap: () {},
              );
            }
          }),
    ),
  );
}

class _BuildBodyListCoinsWidget extends ConsumerWidget {
  const _BuildBodyListCoinsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(coinsListViewModelProvider).when(
        data: (coinsList) {
          if (coinsList.isEmpty) {
            return Error(
                message: 'No Cryptocurrencies found', callback: () => {});
          }
          return ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/cryptocurrencies',
                      arguments: '${coinsList[index].id}');
                },
                child: new Card(
                  margin: EdgeInsets.all(0.5),
                  elevation: 8.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: Row(
                      children: [
                        watch(coinViewModelProvider('${coinsList[index].id}'))
                            .when(data: (coin) {
                                  // if (coin.id == '${coinsList[index].id}') {
                                    return Hero(
                                      tag: "imageCoin" + '${coin.id}',
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5.0),
                                        child: Image.network(
                                            '${coin.image.small}',
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    );
                                  // }
                                  // return Icon(Icons.api);
                                },
                                loading: () => const Center(
                                    child: CircularProgressIndicator()),
                                error: (error, _) => Error(
                                    message: error.toString(),
                                    callback: () => {})),
                        new Padding(
                          padding: EdgeInsets.all(8.0),
                          // padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: new Text(
                                  '${coinsList[index].id.toUpperCase()}',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                              new Text(
                                '${coinsList[index].symbol.toUpperCase()}',
                                style: new TextStyle(
                                    color: Colors.grey[500], fontSize: 14),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            Error(message: error.toString(), callback: () => {}));
  }
}
