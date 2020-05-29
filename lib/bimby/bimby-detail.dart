import 'package:flutter/material.dart';

class BimbyDetail extends StatefulWidget {
  BimbyDetail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BimbyDetailState createState() => _BimbyDetailState();
}

class _BimbyDetailState extends State<BimbyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bimbyHeader(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[nameRow(), customerRow()]),
    );
  }

  bimbyHeader() {
    return AppBar(
      automaticallyImplyLeading: false, // for hide back arrow
      backgroundColor: Colors.white,
      title:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, 
          children: <Widget>[
            IconButton(
                icon: Icon(
                  IconData(0xe904, fontFamily: 'Bimby'),
                  size: 20,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pushReplacementNamed(context, '/bimby-list'),
            color: Colors.black),
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
      ]),
    );
  }

  nameRow() {
    return Container(
        margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
        padding: EdgeInsets.all(14),
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Ciao ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text("MARIO ROSSI",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color.fromRGBO(12, 153, 61, 1)))
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    IconData(0xe90c, fontFamily: 'Bimby'),
                    size: 25,
                    color: Color.fromRGBO(12, 153, 61, 1),
                  ),
                  SizedBox(width: 20),
                  Icon(IconData(0xe900, fontFamily: 'Bimby'),
                      size: 25, color: Colors.grey[200]),
                  SizedBox(width: 20),
                  Icon(IconData(0xe900, fontFamily: 'Bimby'),
                      size: 25, color: Colors.grey[200]),
                  SizedBox(width: 20),
                  Icon(IconData(0xe900, fontFamily: 'Bimby'),
                      size: 25, color: Colors.grey[200]),
                  SizedBox(width: 125),
                ])
          ],
        ));
  }

  customerRow() {
    return GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, '/bimby-map'),
        child: Container(
            margin: EdgeInsets.fromLTRB(25, 10, 25, 12),
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Container(
                          height: 600,
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Indirizzo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color.fromRGBO(12, 153, 61, 1))),
                              Text("Via arcimabaldo 9000, 20137 Milano",
                                  style: TextStyle(fontSize: 16))
                            ],
                          ))),
                ])));
  }
}
