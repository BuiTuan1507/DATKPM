import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/screen/login_register/register_password.dart';
import 'package:app_giao_do_an/service/BaseAuth.dart';
import 'package:flutter/material.dart';
class RegisterEmail extends StatefulWidget {
  BaseAuth auth;
  VoidCallback loginCallback;
  RegisterEmail({Key key, this.auth, this.loginCallback}) : super(key: key);
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  String email;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() {
    if (validateAndSave()) {
      setState(() {
        email = emailController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Email',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SignUpEmailPage(context, emailController),
    );
  }

  Widget SignUpEmailPage(context, emailController) {
    return new Form(
      key: _formKey,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _showText(),
          _showPhoneField(emailController),
          _showButton(context)
        ],
      ),
    );

  }

  Widget _showText() {
    return new Container(
      padding: EdgeInsets.only(top: 50, left: 0, right: 0),
      child: Center(
        child: Text(
          'Nhập Email của bạn',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget _showPhoneField(emailController) {
    return new Container(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: TextFormField(
          controller: emailController,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: new InputDecoration(
              labelText: 'Nhập Email của bạn',
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
              icon: new Icon(
                Icons.mail,
                size: 26,
                color: Color(0xFF0C9869),
              )
          ),
          validator: (value) => value.isEmpty ? 'Email không thể trống' : null,
          onSaved: (value) => email = value.trim(),
        ),
    );
  }

  Widget _showButton(context) {
    return new GestureDetector(
      onTap: () {
        validateAndSubmit();
        if(email !=null)
        {
          Navigator.pushNamed(context, REGISTERPASSWORD,arguments:{
          'auth': widget.auth,
          'loginCallback': widget.loginCallback,
          'email':email
          });
        }

      },
      child: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 0),
        height: 95.0,


        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: Colors.amberAccent,
          color: Colors.amber,


          child: Center(
            child: Text(
              'Tiếp',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ),

    );

  }

}