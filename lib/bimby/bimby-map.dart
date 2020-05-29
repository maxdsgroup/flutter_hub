import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

Future<void> main() async {
  GoogleMap.init('AIzaSyDfDsXGLQfXEYd-mQm-FcUUl49SS0t7b_E');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BimbyMap());
}

class BimbyMap extends StatefulWidget{
  BimbyMap({Key key, this.title}) : super(key: key);
  
  final String title;
  
  @override
  _BimbyMapState createState() => _BimbyMapState();
}

class _BimbyMapState extends State<BimbyMap>{

  final _key = GlobalKey<GoogleMapStateBase>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bimbyHeader(),      
      body:
      GoogleMap(
              key: _key,
              initialZoom: 12,
              initialPosition: GeoCoord(34, -118),
              mapType: MapType.roadmap,
              interactive: true,
              markers: {Marker(GeoCoord(34, -118))},
            )
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
                onPressed: () => Navigator.pushReplacementNamed(context, '/bimby-detail'),
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
}
