import 'package:flutter/material.dart';
import 'package:indexcyc/screen/about.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'setting.dart';
import 'home.dart';
import 'location.dart';
import 'payment.dart';
import 'about.dart';
// ignore: unused_import
import 'settings.dart';

class Launcher extends StatefulWidget {
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  int _currentIndex = 0;
  List<Widget> _pageWidget = <Widget>[
    Home(),
    About(),
    Payment(),
    Location(),
    Settings(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white.withOpacity(.6),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Home'),
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Status'),
              icon: Icon(Icons.source_outlined)),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Payment'),
              icon: Icon(Icons.payment)),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('location'),
              icon: Icon(Icons.add_location_alt_outlined)),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Setting'),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
