import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  static const routeName = '/about';

  @override
  State<StatefulWidget> createState() {
    return _PaymentState();
  }
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Payment'),
        ],
      )),
    );
  }
}
