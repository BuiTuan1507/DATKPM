import 'package:flutter/material.dart';
class UserFriend extends StatefulWidget {
  @override
  _UserFriendState createState() => _UserFriendState();
}

class _UserFriendState extends State<UserFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Bạn bè', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 150,),
            Center(
              child: Text('Bạn chưa có người bạn nào'),
            )
          ],
        ),
      ),
    );
  }
}
