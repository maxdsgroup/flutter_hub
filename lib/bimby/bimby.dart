import 'package:flutter/material.dart';
import 'package:flutter_hub/screens/ActionItemsSimple.dart';

class Bimby extends StatefulWidget {
  Bimby({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BimbyState createState() => _BimbyState();
}

class _BimbyState extends State<Bimby> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
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
    );
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

  buildCard() => new Container(
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
      );
}

// import 'package:flutter_hub/model/articleHolder.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


// class Bimbi extends StatelessWidget {
//   @override
//   AnimationsTestState createState() => AnimationsTestState();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           _MyAppBar(),
//           SliverToBoxAdapter(child: SizedBox(height: 12)),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                 (context, index) => AnimationsTestState(index)),
//           ),
//         ],
//       ),
//     );
//   }
// }




// class _MyAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       title: Text('News', style: Theme.of(context).textTheme.headline5),
//       floating: true,
//       actions: [
//         Row(
//           children: <Widget>[
//             Consumer<ArticlesHolder>(
//                 builder: (context, articles, child) => Text(
//                     'search:',
//                     style: Theme.of(context).textTheme.bodyText1)),
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () => Navigator.pushNamed(context, '/search'),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

// class AnimationsTestState extends State<_MyListItem>  with TickerProviderStateMixin {
//   AnimationController _controller;
//   Animation animation;

//   bool pressed = false;
//   final int index;

//   _MyListItem(this.index, {Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var news = Provider.of<ArticlesHolder>(context);
//     var item = news.items[index];
//     var textTheme = Theme.of(context).textTheme;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: LimitedBox(
//         // maxHeight: 200,
//         child: Row(
//           children: [
//             Expanded(
//               child: 
//                 Column(
//                   children: <Widget>[
//                     Image.network(
//                     item.urlToImage,
//                     fit: BoxFit.fill,
//                   ),
//                   Text(item.title, style: textTheme.headline6),
//                   ]
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
