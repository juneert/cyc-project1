import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectcyc/router.dart';
import 'package:flutter/material.dart';
//เก็บค่าต่างๆของ widget
//event เป็น Null จะอินนิเชียลค่า authen ถ้าไม่ใช่จะอินนิเชียลค่า myService
String initialRoute = '/authen';
Future<Null> main() async {
  //ทำงานในเทรดให้เสร็จก่อน
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != Null) {
        initialRoute = '/authen';
      }
      runApp(MyApp());
    });
  });
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: initialRoute,
    );
  }
}
