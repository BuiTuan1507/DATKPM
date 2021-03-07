import 'package:flutter/material.dart';
class OnSale extends StatefulWidget {
  @override
  _OnSaleState createState() => _OnSaleState();
}

class _OnSaleState extends State<OnSale> {
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
