import 'package:app_giao_do_an/model/post.dart';
import 'package:flutter/material.dart';
class RefuseItem extends StatefulWidget {
  List<Post> refuse;
  RefuseItem({Key key, this.refuse}) : super(key: key);
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
