import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/screen/login_register/register_email.dart';
import 'package:app_giao_do_an/service/BaseAuth.dart';
import 'package:flutter/material.dart';
class RegisterPhone extends StatefulWidget {
  String email;
  String password;
  String name;
  BaseAuth auth;
  VoidCallback loginCallback;
  RegisterPhone({Key key, this.email,this.password,this.name ,this.auth, this.loginCallback}) : super(key: key);
  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  String phone;

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
        phone = phoneController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Số điện thoại',),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SignUpPhonePage(context, phoneController),
    );
  }

  Widget SignUpPhonePage(context, phoneController) {
    return new Form(
      key: _formKey,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _showText(),
          _showPhoneField(phoneController),
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
          'Nhập Số điện thoại của bạn',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget _showPhoneField(phoneController) {
    return new Container(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Số điện thoại của bạn',
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber))),
          validator: (value) => value.isEmpty ? 'Số điện thoại không thể trống' : null,
          onSaved: (value) => phone = value.trim(),
        ));
  }

  Widget _showButton(context) {
    return new GestureDetector(
      onTap: () {
        validateAndSubmit();
        if(phone !=null)
        {
          Navigator.pushNamed(context, REGISTER,arguments:{
            'auth': widget.auth,
            'loginCallback': widget.loginCallback,
            'email':widget.email,
            'password':widget.password,
            'name':widget.name,
            'phone':phone
          });
        }

      },
      child: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 0),
        height: 95.0,


        child: Material(
          borderRadius: BorderRadius.circular(10.0),

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