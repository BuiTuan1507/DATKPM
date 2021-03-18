import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/service/BaseAuth.dart';
import 'package:flutter/material.dart';
class RegisterPassword extends StatefulWidget {
  String email;
  BaseAuth auth;
  VoidCallback loginCallback;
  RegisterPassword({Key key, this.email, this.auth, this.loginCallback}) : super(key: key);
  @override
  _RegisterPasswordState createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();

  String pass;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
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
        pass = passController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Mật khẩu',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SignUpPassPage(context),
    );
  }

  Widget SignUpPassPage(context) {
    return new Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _showText(),
          _showPasswordField(),
          _showButton(context)
        ],

      ),
    );
  }

  Widget _showText() {
    return new Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 70, bottom: 0),
      child: Center(
        child: Text(
          'Chọn mật khẩu',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold

          ),
        ),
      ),

    );
  }

  Widget _showPasswordField() {
    return new Container(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: TextFormField(
          controller: passController,
          maxLines: 1,
          obscureText: _obscureText,
          autofocus: false,
          decoration: new InputDecoration(

              suffixIcon: (_obscureText == true) ? InkWell(onTap: _toggle,child: Icon(Icons.visibility,size: 28,color: Colors.grey,),)
                  : InkWell(onTap: _toggle,child: Icon(Icons.visibility_off,size: 28,color: Colors.grey,),) ,
              labelText: 'Nhập mật khẩu',
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
              icon: new Icon(
                Icons.lock,
                size: 26,
                color: Color(0xFF0C9869),
              )),
          validator: (value) => value.isEmpty ? 'Mật khẩu không thể trống' : null,
          onSaved: (value) => pass = value.trim(),
        ),);
  }

  Widget _showButton(context) {
    return new GestureDetector(
      onTap: () {
        validateAndSubmit();
        if (pass != null)
        {
          Navigator.pushNamed(context, REGISTERNAME,arguments:{
            'auth': widget.auth,
            'loginCallback': widget.loginCallback,
            'email':widget.email,
            'password':pass
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