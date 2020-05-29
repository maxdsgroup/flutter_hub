import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Welcome to Flutter Hub',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'go to specific test project/page:',
                style: Theme.of(context).textTheme.headline6,
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: 'Username',
              //   ),
              // ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: 'Password',
              //   ),
              //   obscureText: true,
                
              //   enableSuggestions: true,
              // ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.white,
                child: Text('GO TO > BIMBY APP'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/bimby-home');
                },
              ),
              RaisedButton(
                color: Colors.white,
                child: Text('GO TO > BIMBY LIST'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/bimby-list');
                },
              ),
              RaisedButton(
                color: Colors.white,
                child: Text('GO TO > BIMBY DETAIL'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/bimby-detail');
                },
              ),
              RaisedButton(
                color: Colors.white,
                child: Text('GO TO > BIMBY MAP'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/bimby-map');
                },
              ),
              RaisedButton(
                color: Colors.white,
                child: Text('GO TO > NEWS APP'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/news');
                },
              ),
              RaisedButton(
                color: Colors.white,
                child: Text('GO TO > ANIMATIONS'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/animations');
                },
              ),
              // RaisedButton(
              //   color: Colors.white,
              //   child: Text('GO TO > TODO PAGE'),
              //   onPressed: () {
              //     Navigator.pushReplacementNamed(context, '/todo');
              //   },
              // ),
              RaisedButton(
                color: Colors.white,
                child: Text('GO TO > TODO PAGE'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/todotwo');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
