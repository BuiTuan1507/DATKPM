import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeInfo extends StatefulWidget {
  User userOnline;
  int sexU;
  ChangeInfo({Key key, this.userOnline, this.sexU}) : super(key: key);
  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  final _formKey = new GlobalKey<FormState>();

  String nameChange;

  String passwordChange;
  String addressChange;
  String phoneNumberChange;
  User _user;
  int sexChange;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Consumer<ProviderController> (builder: (context,provider,child){
      _user = provider.userOnline;

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
                                  keyboardType: TextInputType.name,
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
                                  keyboardType: TextInputType.visiblePassword,
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
                                        Icons.lock_open,
                                        size: 26,
                                        color: Color(0xFF0C9869),
                                      )),
                                  validator: (value) => value.isEmpty
                                      ? 'Email không thể trống'
                                      : null,
                                  onSaved: (value) =>
                                  passwordChange = value.trim(),
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

                                  initialValue: _user.address,
                                  maxLines: 1,
                                  keyboardType: TextInputType.streetAddress,
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
                                  addressChange = value.trim(),
                                ),
                              ),
                              Container(height: 15),
                              Container(
                                width: mediaQuery.size.width,
                                padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 15),
                                child: Text(
                                  'Phone',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                child: TextFormField(

                                  initialValue: _user.phoneNumber,
                                  maxLines: 1,
                                  keyboardType: TextInputType.phone,
                                  autofocus: false,
                                  decoration: new InputDecoration(
                                      labelText: 'Phone',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green)),
                                      icon: new Icon(
                                        Icons.phone,
                                        size: 26,
                                        color: Color(0xFF0C9869),
                                      )),
                                  validator: (value) => value.isEmpty
                                      ? 'Email không thể trống'
                                      : null,
                                  onSaved: (value) =>
                                  phoneNumberChange = value.trim(),
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
                    groupValue: sexChange,
                    onChanged: (value) {
                      setState(() {
                        sexChange = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Nam'),
                  leading: Radio(
                    value: 1,
                    groupValue: sexChange,
                    onChanged: (value) {
                      setState(() {
                        sexChange = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Nữ'),
                  leading: Radio(
                    value: 2,
                    groupValue: sexChange,
                    onChanged: (value) {
                      setState(() {
                        sexChange = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Không muốn tiết lộ'),
                  leading: Radio(
                    value: 3,
                    groupValue: sexChange,
                    onChanged: (value) {
                      setState(() {
                        sexChange = value;
                      });
                    },
                  ),
                ),
                InkWell(
                  onTap: (){
                    if(validateAndSave()){
                      provider.updateUserInfo(nameChange, passwordChange, addressChange,phoneNumberChange, sexChange);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Thông báo'),
                              content: Text("Bạn đã thay đổi thông tin thành công"),
                              actions: [
                                FlatButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    }

                  },
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
