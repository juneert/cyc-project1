import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class StatefulWidget {
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
              child: Text(
            'จองเวลา',
            style: TextStyle(
              fontSize: 35.0,
              color: Colors.blue.shade900,
            ),
          )),
          ListTile(
            onTap: () {},
            title: Text('09.00'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('09.30'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('10.00'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('10.30'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('11.00'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('11.30'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('13.00'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('13.30'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('14.00'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('14.30'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('15.00'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('15.30'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            title: Text('16.00'),
            leading: Icon(Icons.timelapse),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.timelapse),
            title: Text('16.30'),
          ),
          ListTile(
            onTap: () {},
            title: Text('17.00'),
            leading: Icon(Icons.timelapse),
          ),
        ],
      ),
    );
  }
}
