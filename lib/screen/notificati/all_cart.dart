import 'package:flutter/material.dart';
class AllCart extends StatefulWidget {
  @override
  _AllCartState createState() => _AllCartState();
}

class _AllCartState extends State<AllCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('all cart'),
            )
          ],
        ),
      ),
    );
  }
}
