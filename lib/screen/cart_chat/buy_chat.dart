import 'package:flutter/material.dart';
class BuyChat extends StatefulWidget {
  @override
  _BuyChatState createState() => _BuyChatState();
}

class _BuyChatState extends State<BuyChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:<Widget> [
          Container(
            height: 100,
          ),
          Container(
            child: Center(
              child: Text('H'),
            ),
          )
        ],
      ),
    );
  }
}
