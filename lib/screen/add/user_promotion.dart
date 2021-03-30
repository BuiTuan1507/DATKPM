import 'package:flutter/material.dart';
class UserPromotion extends StatefulWidget {
  @override
  _UserPromotionState createState() => _UserPromotionState();
}

class _UserPromotionState extends State<UserPromotion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Thông tin khuyến mãi', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 150,),
            Center(
              child: Text('Giảm giá'),
            )
          ],
        ),
      ),
    );
  }
}
