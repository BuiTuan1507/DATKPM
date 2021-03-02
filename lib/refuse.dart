import 'package:flutter/material.dart';
class RefuseItem extends StatefulWidget {
  @override
  _RefuseItemState createState() => _RefuseItemState();
}

class _RefuseItemState extends State<RefuseItem> {
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
    );
  }
}
