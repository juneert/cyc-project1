import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Color(0xffb61827); // ตัวอักษร
  Color primaryColor = Color(0xffff867c); //พื้นหลัง
  Color lightColor = Color(0xffef5350); // พื้นหลังตัวอ่อน

  TextStyle redBoldStyle() => TextStyle(
        color: Colors.red.shade700,
        fontWeight: FontWeight.bold,
      );

  Widget showLogo() => Image.asset('images/car1.png');

  Widget titleH1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: darkColor,
        ),
      );

  Widget titleH2(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: darkColor,
        ),
      );
  
  Widget titleH2White(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );


  Widget titleH3(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          //fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
  
  Widget titleH3White(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          //fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  MyStyle();
}
