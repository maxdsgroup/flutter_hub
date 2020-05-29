import 'package:flutter/material.dart';
// import 'package:flutter_hub/screens/ActionItemsSimple.dart';

class BimbyHome extends StatefulWidget {
  BimbyHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BimbyState createState() => _BimbyState();
}

class _BimbyState extends State<BimbyHome> {
  double _footerHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: bimbyHeader(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          helloRow(), 
          customerRow()
          ]),
      bottomNavigationBar: bimbyFooter(),
    );
  }

  // TODO: move to external class
  bimbyHeader(){
    return AppBar(
        automaticallyImplyLeading: false, // for hide back arrow
        backgroundColor: Colors.white,
        title: Row(children: <Widget>[
            Container(
                height: 22,
                child: Image(image: AssetImage('images/bimby.png'))),
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
                  color: Colors.black),
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

  helloRow() {
    return Container(
        margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
        padding: EdgeInsets.all(14),
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Ciao ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text("MARIO ROSSI :)",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromRGBO(12, 153, 61, 1)))
          ],
        ));
  }

  customerRow() {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, '/bimby-list'),
      child: 
        Container(
            margin: EdgeInsets.fromLTRB(25, 10, 25, 12),
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text("Lista clienti",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color.fromRGBO(12, 153, 61, 1))),
                                  Text(
                                      "Accedi alla tua lista clienti, consulta i dettagli e crea la tua lista da lavorare.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 14,
                                          color: Colors.grey[600]))
                                ],
                              ))),
                      Icon(
                        IconData(0xe91e, fontFamily: 'Bimby'),
                        size: 40,
                        color: Color.fromRGBO(12, 153, 61, 1),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                          color: Color.fromRGBO(12, 153, 61, 1),
                          child: Icon(Icons.arrow_forward, color: Colors.white)),
                ])
              )
          );
  }

  void _openFooter() {
    setState(() => _footerHeight = _footerHeight == 50.0 ? 150.0 : 50.0);
  }

}
