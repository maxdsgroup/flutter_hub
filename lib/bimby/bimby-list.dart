import 'package:flutter/material.dart';
import 'package:flutter_hub/screens/ActionItemsSimple.dart';

class BimbyList extends StatefulWidget {
  BimbyList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BimbyState createState() => _BimbyState();
}

class _BimbyState extends State<BimbyList> {
  double _footerHeight = 50.0;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: bimbyHeader(),
      body: new Center(
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: OnSlideSimple(items: [
                  new ActionItemsSimple(
                      icon: new IconButton(
                        icon: new Icon(Icons.call),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      onPress: () {},
                      backgroudColor: Colors.green[500]),
                  new ActionItemsSimple(
                      icon: new IconButton(
                        icon: new Icon(Icons.email),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      onPress: () {},
                      backgroudColor: Colors.green[900])
                ], 
                child: buildCard()));
          },
          itemCount: 10,
        ),
      ),
      bottomNavigationBar: bimbyFooter(),
    );
  }

  // TODO: move to external class
  bimbyHeader(){
    return AppBar(
        automaticallyImplyLeading: false, // for hide back arrow
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
                height: 22,
                child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, '/bimby-home'),
                    child:Image(image: AssetImage('images/bimby.png')))
                ),
            Expanded(
              child: Container(),
            ),
            Text(widget.title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bimby')),
            Expanded(
              child: Container(),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
              IconButton(
                  icon: Icon(
                    IconData(0xe915, fontFamily: 'Bimby'),
                    size: 24,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                  color: Colors.black
                  ),
              IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                  color: Colors.grey[600])
            ])
          ])
      );
  }
  
  // TODO: move to external class
  bimbyFooter(){
    return BottomAppBar(
          child: AnimatedContainer(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          color: Color.fromRGBO(18, 60, 45, 1),
          height: _footerHeight,
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 400),
          child:
            GestureDetector(
                onTap: _openFooter,
                child: 
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Vorwerk Bimby',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bimby')),
                            SizedBox(height: 25),
                            Text('Termini e condizioni',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bimby')),
                            SizedBox(height: 10),
                            Text('Bimby.it',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bimby')),
                            SizedBox(height: 10),
                            Text('Cookidoo',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bimby')),
                          ]),
                      Expanded(child: Container()),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text(
                                _footerHeight != 50.0 ? 'Chiudi footer' : 'Apri footer',
                                style: 
                                  TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Bimby')
                              ),
                              Icon( _footerHeight != 50.0
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                                color: Colors.white
                              ),
                            ]),
                            SizedBox(height: 25),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Social media:',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Bimby')
                                ),
                                SizedBox(height: 5),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(IconData(0xe929, fontFamily: 'Bimby'),
                                      size: 12, color: Colors.white),
                                  SizedBox(width: 20),
                                  Icon(IconData(0xe926, fontFamily: 'Bimby'),
                                      size: 12, color: Colors.white),
                                  SizedBox(width: 20),
                                  Icon(IconData(0xe925, fontFamily: 'Bimby'),
                                      size: 12, color: Colors.white),
                                  SizedBox(width: 20),
                                  Icon(IconData(0xe928, fontFamily: 'Bimby'),
                                      size: 12, color: Colors.white),
                                  SizedBox(width: 20),
                                  Icon(IconData(0xe927, fontFamily: 'Bimby'),
                                      size: 12, color: Colors.white)
                                ]),
                              ]
                            ),
                          ]),
                    ])),
      ));
  }


  Widget text(String up, String down) {
    return Column(
      children: <Widget>[
        Text(
          up,
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
        Text(
          down,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  firstRow() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: new Row(
          children: <Widget>[
            new Icon(
              Icons.person_pin,
              color: Colors.green[800],
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Mario Rossi",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text("Via arcimabaldo 9000, 20137 Milano",
                    style: TextStyle(fontSize: 16))
              ],
            ),
            Expanded(
              child: Container(),
            ),
            new Icon(
              Icons.content_paste,
              color: Colors.green[800],
            )
          ],
        ));
  }

  buildCard() => new  GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, '/bimby-detail'),
      child: 
        Container(
          width: 300.0,
          height: 150.0,
          child: new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey[200],
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[800],
                    blurRadius: 5.0,
                    // has the effect of softening the shadow
                    spreadRadius: 2.0,
                    // has the effect of extending the shadow
                    offset: Offset(
                      2.0, // horizontal, move right 10
                      2.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: new BorderRadius.all(const Radius.circular(0.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  firstRow(),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[500],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text("Ult.mod.", "TM5"),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ),
                      text("Ult.acquisto", "21.12.2020"),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ),
                      text("Tipo ult. cont.", "Demo")
                    ],
                  ),
                  Expanded(
                      child: Container(
                          color: Colors.grey[100],
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Icon(
                                Icons.shopping_basket,
                                color: Colors.green[800],
                              ),
                              new Icon(
                                Icons.home,
                                color: Colors.grey[400],
                              ),
                              new Icon(
                                Icons.airport_shuttle,
                                color: Colors.green[800],
                              ),
                              new Icon(
                                Icons.airline_seat_flat,
                                color: Colors.green[800],
                              ),
                              new Icon(
                                Icons.perm_device_information,
                                color: Colors.grey[400],
                              ),
                              SizedBox(
                                width: 100,
                              )
                            ],
                          )))
                ],
              )),
        )
      );

    void _openFooter() {
    setState(() => _footerHeight = _footerHeight == 50.0 ? 150.0 : 50.0);
  }

}
