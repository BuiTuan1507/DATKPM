import 'package:flutter/material.dart';
class OtherApp extends StatefulWidget {
  @override
  _OtherAppState createState() => _OtherAppState();
}

class _OtherAppState extends State<OtherApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
                "Bạn chưa có tin nào trong mục này"
            ),
          )
        ],
      ),
    );;
  }
}