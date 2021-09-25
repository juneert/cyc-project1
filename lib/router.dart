import 'package:projectcyc/widget/authen.dart';
import 'package:projectcyc/widget/my_service.dart';
import 'package:projectcyc/widget/register.dart';
import 'package:flutter/material.dart';

import 'widget/authen.dart';

//เก็บค่าของmapของ widgetbuilder ไว้
//หน้าเชื่อม หรือ router
final Map<String, WidgetBuilder> routes = {
  '/authen': (BuildContext context) => Authen(),
  '/register': (BuildContext context) => Register(),
  '/myService': (BuildContext context) => MyService(),
};
