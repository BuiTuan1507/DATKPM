import 'package:flutter/material.dart';
class ChangeInfo extends StatefulWidget {
  String name;
  String email;
  String password;
  String address;
  int sex;
  String dateOfBird;

  ChangeInfo({Key key, this.name, this.email, this.password,this.address, this.dateOfBird,this.sex}) : super(key: key);
  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Thay đổi thông tin cá nhân', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(12),
              child: new Form(
                key: _formKey,
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 200,
                            padding: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                            child: Text('Tên của bạn', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Colors.black),),
                          ),
                          Container(
                            child: TextFormField(
                              initialValue: widget.password ,
                              maxLines: 1,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              decoration: new InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      fontSize: 20,
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
                              onSaved: (value) => widget.email = value.trim(),
                            ),
                          ),
                        ],
                      )
                    ]
                  )
              )
          )
        ],
      ),
      )

    );
  }
}
