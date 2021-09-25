import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectcyc/utility/dialog.dart';
import 'package:projectcyc/utility/my_style.dart';

//stf stateful โค้ดลัด ไม่ต้องพิมพ์เยอะ
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  double screen;
  String name, email, password, telephone, plate, brand;

  Container buildName() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white60),
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.70,
      child: TextField(
        //trim เป็นตัวตัดช่องว่างข้างหน้าและข้างหลังออกในกรณีมีช่องว่าง
        onChanged: (value) => name = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'Name',
          prefixIcon: Icon(
            Icons.fingerprint,
            color: MyStyle().darkColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ), //กรอบสี่เหลี่ยม
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

  Container buildemail() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white60),
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.70,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => email = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'Email&User',
          prefixIcon: Icon(
            Icons.email_outlined,
            color: MyStyle().darkColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.70,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'Password',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: MyStyle().darkColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ), //กรอบสี่เหลี่ยม
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

/*
  Container buildTelephone() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white60),
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.70,
      child: TextField(
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'Telephone',
          prefixIcon: Icon(
            Icons.smartphone_outlined,
            color: MyStyle().darkColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ), //กรอบสี่เหลี่ยม
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

//ป้ายทะเบียน
  Container buildPlate() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white60),
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.70,
      child: TextField(
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'Plate',
          prefixIcon: Icon(
            Icons.stars_rounded,
            color: MyStyle().darkColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ), //กรอบสี่เหลี่ยม
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

//ยี่ห้อรถ
  Container buildBrand() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white60),
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.70,
      child: TextField(
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'Brand',
          prefixIcon: Icon(
            Icons.single_bed_rounded,
            color: MyStyle().darkColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ), //กรอบสี่เหลี่ยม
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text('New Register'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            buildName(),
            buildemail(),
            buildPassword(),
            //buildTelephone(),
            // buildPlate(),
            // buildBrand(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: MyStyle().darkColor,
      onPressed: () {
        print(
            'name = $name, email = $email, password =$password'); //,telephone = $telephone,plate = $plate,brand = $brand
        if ((name?.isEmpty ?? true) ||
                (email?.isEmpty ?? true) ||
                (password?.isEmpty ?? true)
            /*||
            (telephone?.isEmpty ?? true) ||
            (plate?.isEmpty ?? true) ||
            (brand?.isEmpty ?? true)*/
            ) {
          print('Have Spece');
          normalDialog(context, 'Have Spece ? Please Fill Every Blank');
        } else {
          print('No Spece');
          registerFirebase();
        }
      },
      child: Icon(Icons.cloud_upload_rounded),
    );
  }

  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) async {
      print('##### เชื่อมต่อ Firebase สำเร็จแล้ว #####');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        print('ลงทะเบียนสำเร็จแล้ว !!!');
        await value.user.updateProfile(displayName: name).then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/myService', (route) => false));
      }).catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }
}
