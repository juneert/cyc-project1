import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  static const routeName = '/about';

  @override
  State<StatefulWidget> createState() {
    return _LocationState();
  }
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Location'),
        ],
      )),
    );
  }
}
