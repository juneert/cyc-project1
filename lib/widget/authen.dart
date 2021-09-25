import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectcyc/utility/dialog.dart';
import 'package:projectcyc/utility/my_style.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double screen;
  bool statusRedEye = true;
  String user, password;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      floatingActionButton: buildRegister(),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.33),
            radius: 1.0,
            colors: <Color>[Colors.white, MyStyle().lightColor],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLogo(),
                MyStyle().titleH1('CYC <CareYourCar> '), //CYC = care your car
                buildUser(),
                buildPassword(),
                buildLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton buildRegister() {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, '/register'),
      child: Text(
        'New Register',
        style: TextStyle(color: Colors.white60),
      ),
    );
  }

  Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: ElevatedButton(
        onPressed: () {
          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            normalDialog(context, 'ห้ามมีช่องว่าง กรณีกรอกให้ถูกต้อง');
          } else {
            checkAuthen();
          }
        },
        child: Text('Login'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().darkColor,
          shape: RoundedRectangleBorder(),
        ),
      ),
    );
  }

  Container buildUser() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white60),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.70,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => user = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'User',
          prefixIcon: Icon(Icons.perm_identity),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().darkColor),
          ), //กรอบสี่เหลี่ยม
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white60),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.70,
      child: TextField(
        obscureText: statusRedEye,
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: statusRedEye
                  ? Icon(Icons.remove_red_eye)
                  : Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                setState(() {
                  statusRedEye = !statusRedEye;
                });
                print('statusRedEye = $statusRedEye');
              }),
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'password',
          prefixIcon: Icon(Icons.lock_outline),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().darkColor),
          ), //กรอบสี่เหลี่ยม
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
        margin: EdgeInsets.only(top: 16),
        width: screen * 0.4,
        child: MyStyle().showLogo());
  }

  Future<Null> checkAuthen() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: user, password: password)
          .then((value) => Navigator.pushNamedAndRemoveUntil(
              context, '/myService', (route) => false))
          .catchError((value) => normalDialog(context, value.message));
    });
  }
}
