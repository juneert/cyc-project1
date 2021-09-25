import 'package:flutter/material.dart';
import 'package:projectcyc/utility/my_style.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('images/car1.png'),
        title: Text(
          'กรุณากรอกข้อมูลให้ครบถ้วน',
          style: MyStyle().redBoldStyle(),
        ),
        subtitle: Text(string),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: Text('OK'),
        ),
      ],
    ),
  );
}
