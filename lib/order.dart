import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Text("order", style: TextStyle(fontSize: 30),)
          ),
        ));
  }
}
