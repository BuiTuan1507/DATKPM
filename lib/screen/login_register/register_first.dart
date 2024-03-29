import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/service/BaseAuth.dart';
import 'package:flutter/material.dart';
class RegisterFirst extends StatefulWidget {
  BaseAuth auth;
  VoidCallback loginCallback;
  RegisterFirst({Key key, this.auth, this.loginCallback}) : super(key: key);
  @override
  _RegisterFirstState createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Tạo tài khoản',),
        backgroundColor: Colors.amber,
      ),
      body: SignUpPage(context),
    );
  }

  Widget SignUpPage(context) {
    return new Column(
      children: <Widget>[
        _showImage(),
        _showText1(),
        _showText2(),
        _showButton(context),
        _showPopButton(context)
      ],
    );
  }

  Widget _showImage() {
    return new Container(
      padding: EdgeInsets.only(left: 30, right: 20),
      width: 400,
      height: 300,
      child: Row(
        children: <Widget>[
          Image.asset("assets/loginLogo.jpg",
              width: 300,
              height: 225,
              fit: BoxFit.fill)
        ],
      ),
    );
  }

  Widget _showText1() {
    return new Container(

        child: Text(
          'Tham gia chợ Bách Khoa',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        )

    );
  }

  Widget _showText2() {
    return new Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 15),
      child: Text(
        'Chúng tôi sẽ giúp bạn tạo tài  khoản sau vài bước thực hiện dễ dàng',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16
        ),
      ),
    );
  }

  Widget _showButton(context) {
    return new GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, REGISTEREMAIL, arguments: {
          'auth': widget.auth,
          'loginCallback': widget.loginCallback
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 20, right: 20),
        height: 75.0,


        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: Colors.amberAccent,
          color: Colors.amber,

          child: Center(
            child: Text(
              'Tiếp',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ),


    );
  }

  Widget _showPopButton(context) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 30, right: 30),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            }, child: Center(
          child: Text(
            'Đã có tài khoản', style: TextStyle(
            color: Color(0xFF0C9869),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
            textAlign: TextAlign.center,

          ),
        )
        )

    );
  }
}