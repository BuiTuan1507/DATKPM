import 'package:app_giao_do_an/model/post.dart';
import 'package:flutter/material.dart';
class NeedPay extends StatefulWidget {
  List<Post> needPay;
  NeedPay({Key key, this.needPay}) : super(key: key);
  @override
  _NeedPayState createState() => _NeedPayState();
}

class _NeedPayState extends State<NeedPay> {
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
