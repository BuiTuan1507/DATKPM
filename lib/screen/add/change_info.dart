import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeInfo extends StatefulWidget {
  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  final _formKey = new GlobalKey<FormState>();
  String nameChange;
  String emailChange;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Consumer<ProviderController> (builder: (context,provider,child){
      User _user = provider.userOnline;
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(
              'Thay đổi thông tin cá nhân',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                Container(
                    padding: EdgeInsets.all(10),
                    child: new Form(
                        key: _formKey,
                        child: new ListView(shrinkWrap: true, children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: mediaQuery.size.width,
                                padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 15),
                                child: Text(
                                  'Tên của bạn',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  initialValue: _user.name,
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  decoration: new InputDecoration(
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green)),
                                      icon: new Icon(
                                        Icons.person_pin,
                                        size: 26,
                                        color: Color(0xFF0C9869),
                                      )),
                                  validator: (value) => value.isEmpty
                                      ? 'Tên không thể trống'
                                      : null,
                                  onSaved: (value) => nameChange = value.trim(),
                                ),
                              ),
                              Container(height: 15),
                              Container(
                                width: mediaQuery.size.width,
                                padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 15),
                                child: Text(
                                  'Email của bạn',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  initialValue: _user.email,
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
                                          borderSide:
                                          BorderSide(color: Colors.green)),
                                      icon: new Icon(
                                        Icons.mail,
                                        size: 26,
                                        color: Color(0xFF0C9869),
                                      )),
                                  validator: (value) => value.isEmpty
                                      ? 'Email không thể trống'
                                      : null,
                                  onSaved: (value) => emailChange = value.trim(),
                                ),
                              ),
                              Container(height: 15),
                              Container(
                                width: mediaQuery.size.width,
                                padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 15),
                                child: Text(
                                  'Mật khẩu của bạn',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  initialValue: _user.password,
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  decoration: new InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green)),
                                      icon: new Icon(
                                        Icons.mail,
                                        size: 26,
                                        color: Color(0xFF0C9869),
                                      )),
                                  validator: (value) => value.isEmpty
                                      ? 'Email không thể trống'
                                      : null,
                                  onSaved: (value) =>
                                  widget.password = value.trim(),
                                ),
                              ),
                              Container(height: 15),
                              Container(
                                width: mediaQuery.size.width,
                                padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 15),
                                child: Text(
                                  'Địa chỉ của bạn',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  initialValue: widget.address,
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  decoration: new InputDecoration(
                                      labelText: 'Address',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green)),
                                      icon: new Icon(
                                        Icons.home,
                                        size: 26,
                                        color: Color(0xFF0C9869),
                                      )),
                                  validator: (value) => value.isEmpty
                                      ? 'Email không thể trống'
                                      : null,
                                  onSaved: (value) =>
                                  widget.address = value.trim(),
                                ),
                              ),
                              Container(height: 15),
                              Container(
                                width: mediaQuery.size.width,
                                padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 15),
                                child: Text(
                                  'Date Of Birth',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  initialValue: widget.dateOfBirth,
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  decoration: new InputDecoration(
                                      labelText: 'Date of Bidth',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green)),
                                      icon: new Icon(
                                        Icons.mail,
                                        size: 26,
                                        color: Color(0xFF0C9869),
                                      )),
                                  validator: (value) => value.isEmpty
                                      ? 'Email không thể trống'
                                      : null,
                                  onSaved: (value) =>
                                  widget.dateOfBirth = value.trim(),
                                ),
                              ),
                              Container(height: 15),

                            ],
                          )
                        ]
                        )
                    )
                ),
                Container(
                  width: mediaQuery.size.width,
                  padding:
                  EdgeInsets.only(top: 10, bottom: 5, left: 15),
                  child: Text(
                    'Giới tính của bạn',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                ListTile(
                  title: const Text('Chưa xác định'),
                  leading: Radio(
                    value: 0,
                    groupValue: widget.sex,
                    onChanged: (value) {
                      setState(() {
                        widget.sex = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Nam'),
                  leading: Radio(
                    value: 1,
                    groupValue: widget.sex,
                    onChanged: (value) {
                      setState(() {
                        widget.sex = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Nữ'),
                  leading: Radio(
                    value: 2,
                    groupValue: widget.sex,
                    onChanged: (value) {
                      setState(() {
                        widget.sex = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Không muốn tiết lộ'),
                  leading: Radio(
                    value: 3,
                    groupValue: widget.sex,
                    onChanged: (value) {
                      setState(() {
                        widget.sex = value;
                      });
                    },
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text('Thay đổi',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),),
                  ),
                ),
                Container(
                  height: 25,
                )
              ],
            ),
          ));
    });

  }
}
