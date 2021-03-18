import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/screen/login_register/register_phone.dart';
import 'package:app_giao_do_an/service/BaseAuth.dart';
import 'package:flutter/material.dart';
class RegisterName extends StatefulWidget {
  String email;
  String password;
  BaseAuth auth;
  VoidCallback loginCallback;
  RegisterName({Key key, this.email,this.password, this.auth, this.loginCallback}) : super(key: key);
  @override
  _RegisterNameState createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();

  String name;

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
        name = firstNameController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Đăng ký tài khoản'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SignUpNamePage(context, _formKey, firstNameController),
    );
  }

  Widget SignUpNamePage(context, _formKey, firstNameController) {
    return new Column(
      children: <Widget>[
        _showTextName(),
        Form(
          key: _formKey,
          child: Row(
            children: <Widget>[

              _showFirstNameField(context, firstNameController)
            ],
          ),
        ),
        _showButton(context)
      ],
    );
  }

  Widget _showTextName() {
    return new Container(
      padding: EdgeInsets.only(top: 30, right: 0, left: 0),
      child: Text(
        'Bạn tên gì ?',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold,
            color: Colors.black87
        ),
      ),
    );
  }

  Widget _showFirstNameField(context, firstNameController) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return new Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      width: width ,
      child: TextFormField(
        controller: firstNameController,
        decoration: InputDecoration(
            labelText: 'Tên của bạn',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green))),
        validator: (value) => value.isEmpty ? 'Tên không thể trống' : null,
        onSaved: (value) => name = value.trim(),
      ),
    );
  }

  Widget _showButton(context) {
    return new GestureDetector(
      onTap: () {
        validateAndSubmit();
        if(name != null)
        {
          Navigator.pushNamed(context, REGISTERPHONENUMBER,arguments:{
            'auth': widget.auth,
            'loginCallback': widget.loginCallback,
            'email':widget.email,
            'password':widget.password,
            'name':name
          });
        }

      },
      child: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 80, bottom: 0),
        height: 125.0,

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