import 'package:flutter/material.dart';
class NewInfomation extends StatefulWidget {
  @override
  _NewInfomationState createState() => _NewInfomationState();
}

class _NewInfomationState extends State<NewInfomation> {
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
                "Bạn không có tin mới nào"
            ),
          )
        ],
      ),
    );
  }
}
