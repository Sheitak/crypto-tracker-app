import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Tracker App'),
        centerTitle: true,
      ),
      body: new ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) {

          String? key = 'ok';
          return new Dismissible(
            key: new Key(key),
            child: new Padding(
              padding: EdgeInsets.only(right: 7.0, left: 7.0),
              child: new Container(
                  child: new Card(
                      elevation: 10.0,
                      child: new InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return new Container();
                                    }
                                )
                            );
                          },
                          child: new Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 7.0, right: 7.0),
                            child: new Column(
                              children: [
                                new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    new Text(
                                      'ok'
                                    ),
                                    new Text(
                                      'ok'
                                    ),
                                  ],
                                ),
                                new Padding(
                                  padding:
                                  EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  child: new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      new Card(
                                        elevation: 7.5,
                                        child: new Container(
                                            width: 150.0,
                                            child: new Container()
                                        ),
                                      ),
                                      new Container(
                                          width: 150.0,
                                          child: new Text(
                                              'ok'
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                      )
                  )
              ),
            ),
            background: new Container(
                padding: EdgeInsets.only(right: 20.0),
                color: Colors.red,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Text(
                        'Supprimer',
                        style: new TextStyle(
                            color: Colors.white
                        )
                    ),
                    new Icon(
                        Icons.delete,
                        color: Colors.white
                    )
                  ],
                )
            ),
            onDismissed: (direction) {
              setState(() {
                // widget.coinsList.name.length.removeAt(i);
              });
            },
          );
        })
    );
  }

}