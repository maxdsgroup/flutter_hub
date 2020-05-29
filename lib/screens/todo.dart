import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final List tasks = [
    {"title": "Comprare il pane", "completed": true},
    {"title": "Aggiungere l'esempio alle slide", "completed": false},
    {"title": "14:00 corso flutter", "completed": false},
    {"title": "18:00 goderti la quarantena", "completed": false},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          header(),
          listaTodo(),
          SizedBox(height: 30.0),
          ...tasks.map((task) => Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListTile(
                  title: Text(
                task["title"],
                style: TextStyle(
                    decoration: task["completed"]
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.red,
                    fontSize: 22.0,
                    color: Colors.black),
              )))),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 20),
                    IconButton(icon: Icon(Icons.menu, size: 30)),
                  ]))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    ));
  }

  header() {
    return Container(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 0,
              left: -100,
              top: -150,
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.deepOrange),
              ))
        ],
      ),
    );
  }

  listaTodo() {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 20.0),
      child: OverflowBox(
        maxWidth: 500,
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Text(
              "Oggi",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 100),
            Text(
              "Domani",
              style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
