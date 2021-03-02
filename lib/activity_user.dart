import 'package:flutter/material.dart';
class ActivityUser extends StatefulWidget {
  @override
  _ActivityUserState createState() => _ActivityUserState();
}

class _ActivityUserState extends State<ActivityUser> {
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
