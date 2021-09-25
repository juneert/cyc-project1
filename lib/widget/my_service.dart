import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectcyc/utility/my_style.dart';
import 'package:projectcyc/widget/authen.dart';
import 'package:projectcyc/widget/contact.dart';
import 'package:projectcyc/widget/homepage.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  String name, email;
  Widget currentWidget = Homepage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findNameAndEmail();
  }

  Future<Null> findNameAndEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event.displayName;
          email = event.email;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text('CYC '),
      ),
      drawer: buildDrawer(),
      body: currentWidget,
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              buildUserAccountsDrawerHeader(),
              buildListTilehomepage(),
              buildListTilecontact(),
              buildListTileLogin(),
            ],
          ),
          buildSignOut(),
        ],
      ),
    );
  }

  ListTile buildListTilehomepage() {
    return ListTile(
      leading: Icon(
        Icons.home_filled,
        size: 36,
      ),
      title: Text('หน้าหลัก'),
      onTap: () {
        setState(() {
          currentWidget = Homepage();
        });
        Navigator.pop(context);
      },
    );
  }
  ListTile buildListTileLogin() {
    return ListTile(
      leading: Icon(
        Icons.home_filled,
        size: 36,
      ),
      title: Text('ล็อกอิน'),
      onTap: () {
        setState(() {
          currentWidget = Authen();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildListTilecontact() {
    return ListTile(
      leading: Icon(
        Icons.contact_page,
        size: 36,
      ),
      title: Text('ติดต่อสอบถาม'),
      onTap: () {
        setState(() {
          currentWidget = Contact();
        });
        Navigator.pop(context);
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.pink),
      accountName: Text(name == null ? 'Name' : name),
      accountEmail: Text(email == null ? 'Email' : email),
      currentAccountPicture: Image.asset('images/car1.png'),
    );
  }

  Column buildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/authen', (route) => false));
            });
          },
          tileColor: Colors.pink,
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
          title: MyStyle().titleH2White('ลงชื่อออก'),
          subtitle: MyStyle().titleH3White('ลงชื่อออก&กลับไปหน้าหลัก'),
        ),
      ],
    );
  }
}
