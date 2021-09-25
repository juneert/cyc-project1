import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var _formKey;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: new ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                children: <Widget>[
                  Center(
                      child: Text(
                    "ประวัติส่วนตัว",
                    style: TextStyle(fontSize: 25, color: Colors.black54),
                  )),
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.person, size: 30),
                        hintText: 'กรุณากรอกชื่อ-นามสกุล',
                        labelText: 'ชื่อ- นามสกุล'),
                    inputFormatters: [new LengthLimitingTextInputFormatter(10)],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกชื่อ-นามสกุล';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var user;
                      user.name = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.email, size: 30),
                        hintText: 'กรุณากรอกอีเมล',
                        labelText: 'อีเมล'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      var emailRegex;
                      if (!emailRegex.hasMatch(value)) {
                        return 'กรุณากรอกอีเมล';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var user;
                      user.email = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.phone, size: 30),
                        hintText: 'กรุณาใส่เบอร์โทรศัพท์',
                        labelText: 'เบอร์โทรศัพท์'),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      // ignore: deprecated_member_use
                      new WhitelistingTextInputFormatter(
                          new RegExp(r'^[0-9]*$')),
                      new LengthLimitingTextInputFormatter(10)
                    ],
                    validator: (value) {
                      var phoneRegex;
                      if (!phoneRegex.hasMatch(value)) {
                        return 'กรุณาใส่เบอร์โทรศัพท์';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var user;
                      user.phoneNo = value;
                    },
                  ),

                  //ยี่ห้อรถ
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.toys, size: 30),
                        hintText: 'กรุณาใส่ยีห้อรถ',
                        labelText: 'ยี่ห้อรถ'),
                    inputFormatters: [new LengthLimitingTextInputFormatter(10)],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณาใส่ยี่ห้อรถ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var user;
                      //brand = ยี่ห้อรถ;
                      user.brand = value;
                    },
                  ),

                  //ป้ายทะเบียนรถ
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.label_important, size: 30),
                        hintText: 'กรุณาใส่ป้ายทะเบียน',
                        labelText: 'ป้ายทะเบียน'),
                    inputFormatters: [new LengthLimitingTextInputFormatter(10)],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณาใส่ป้ายทะเบียน';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var user;
                      //label = ป้ายทะเบียนรถ;
                      user.label = value;
                    },
                  ),
                  //วัน/เดือน/ปี
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(
                          Icons.today_rounded,
                          size: 30,
                        ),
                        hintText: 'กรรุณาใส่วันที่',
                        labelText: 'วัน/เดือน/ปี'),
                    inputFormatters: [new LengthLimitingTextInputFormatter(10)],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณาใส่วันที่';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var user;
                      //dmy = วัน/เดือน/ปี;
                      user.dmy = value;
                    },
                  ),
                  //วัน/เดือน/ปี
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: const Icon(Icons.access_time_filled, size: 30),
                        hintText: 'กรุณาใส่เวลา',
                        labelText: 'เวลา'),
                    inputFormatters: [new LengthLimitingTextInputFormatter(10)],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณาใส่เวลา';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      var user;
                      //time = เวลา;
                      user.time = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        var _formKey;
                        if (_formKey.currentState.validate()) {
                          print("Process data");
                          _formKey.currentState.save();
                          var user;
                          print('Name: ${user.name}');
                          print('Email: ${user.email}');
                          print('Brand: ${user.brand}');
                          print('Phone No: ${user.phoneNo}');
                          print('Label: ${user.label}');
                          print('Day.month.years: ${user.dmy}');
                          print('Time: ${user.time}');
                        } else {
                          print('Error');
                        }
                      },
                      child: Text('save'),
                    ),
                  )
                ],
              ))),
    );
  }
}
