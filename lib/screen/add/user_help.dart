import 'package:flutter/material.dart';
class UserHelp extends StatefulWidget {
  @override
  _UserHelpState createState() => _UserHelpState();
}

class _UserHelpState extends State<UserHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Trợ giúp', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 150,),
            Center(
              child: Text('Bạn cần gì ? '),
            )
          ],
        ),
      ),
    );
  }
}
