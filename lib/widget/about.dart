import 'package:flutter/material.dart';

class About extends StatefulWidget {
  static const routeName = '/about';

  @override
  State<StatefulWidget> createState() {
    return _AboutState();
  }
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status'),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
          child: Text('Check Status'),
          onPressed: () {
            _showDialog(context);
          },
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Status"),
        content: new Text("Complete"),
        actions: <Widget>[
          // ignore: deprecated_member_use
          new FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
