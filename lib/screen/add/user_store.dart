import 'package:flutter/material.dart';
class UserStore extends StatefulWidget {
  @override
  _UserStoreState createState() => _UserStoreState();
}

class _UserStoreState extends State<UserStore> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Cập nhật thông tin cửa hàng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 150,),
            Center(
              child: Text('Chúng tối sẽ giúp bạn tạo của hàng '),
            )
          ],
        ),
      ),
    );
  }
}
