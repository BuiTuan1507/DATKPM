import 'package:flutter/material.dart';
class ContactInfomation extends StatefulWidget {
  @override
  _ContactInfomationState createState() => _ContactInfomationState();
}

class _ContactInfomationState extends State<ContactInfomation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('hello'),
            )
          ],
        ),
      ),
    );
  }
}
