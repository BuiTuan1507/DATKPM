import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UpdateProfile extends StatefulWidget {
  String password;
  UpdateProfile({Key key, this.password}) : super(key: key);
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {



  String hidenPassword = '';
  String star = '*';
  bool isHiddenPassword = false;
  @override
  void initState() {
    // TODO: implement initState
    for(int i = 0; i< widget.password.length; i++){
      hidenPassword = hidenPassword + star;
    }
    super.initState();
  }
  final _formKey = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Consumer<ProviderController> (builder: (context,provider,child){
      User _user = provider.userOnline;
      String sexUser;
      switch(_user.sex){
        case 0: sexUser = "Chưa có thông tin";
        break;
        case 1: sexUser = "Nam";
        break;
        case 2 : sexUser = "Nữ";
        break;
        case 3 : sexUser = "Không muốn tiết lộ";
        break;
      }
      return Scaffold(
          appBar: AppBar(
            title: Text('Cài đặt thông tin', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),),
            backgroundColor: Colors.amber,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 15,right: 15 , top: 20),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(_user.imageUser),
                        radius: 55,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20,top: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(width: 0.5,color: Colors.grey[500])
                          ),
                          child: SizedBox(
                            height: 100,
                            width: queryData.size.width*0.55,
                            child: Column(
                              children: <Widget>[
                                Container(height: 10,),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Họ và tên",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18, color: Colors.grey[400]),),
                                ),
                                Container(
                                  height: 7,
                                ),
                                showNameText(queryData,_user.name,
                                        (){

                                      Navigator.pushNamed(context, CHANGEINFO);
                                    }
                                ),



                              ],
                            ),
                          )

                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 15,left: 15,bottom: 5),
                          child: Text(
                            'Số điện thoại', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey[500]),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5,left: 15, bottom: 10),
                          child: Text(_user.phoneNumber, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),),
                        )
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey[400],
                ),
                (_user.email.length == 0) ?
                (_showData(
                    'Thêm Email',
                        (){

                    }
                )) :
                (_showIfData(
                    'Email',
                    _user.email,
                        (){

                    }
                )),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
                (_user.email.length == 0) ?
                (_showData(
                    'Thêm ngày sinh của bạn',
                        (){

                    }
                )) :
                (_showIfData(
                    'Ngày sinh của bạn',
                    '30/02/1990',
                        (){

                    }
                )),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
                (_user.address.length == 0) ?
                (_showData(
                    'Thêm địa chỉ',
                        (){

                    }
                )) :
                (_showIfData(
                    'Địa chỉ',
                    _user.address,
                        (){

                    }
                )),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
                (_user.sex == 0) ?
                (_showData(
                    'Thêm giới tính',
                        (){

                    }
                )) :
                (_showIfData(
                    'Giới tính',
                    sexUser,
                        (){

                    }
                )),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 15,left: 15,bottom: 5),
                          child: Text(
                            'Mật khẩu', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey[500]),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 5,left: 15, bottom: 10),
                            child: Text( hidenPassword,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black))

                        )
                      ],
                    ),

                  ],
                ),

              ],
            ),


          )
      );
    });

  }
  Widget showNameText(queryData,String name,Function onPress){

    return new Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          width: queryData.size.width*0.5,
          child: Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
        ),
        GestureDetector(
          onTap:

            onPress
          ,
          child: Container(
            height: 40,
            width: 40,

            child: Icon(Icons.edit,size: 28, color: Colors.grey[600],),
          ),
        )

      ],
    );
  }

  Widget _showData (String name, Function onPress){ // hien thi widget khi chua nhap du lieu
    return Row(
      children: <Widget>[
        InkWell(
          onTap: onPress,
          child: Container(
            width: 350,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
            child: Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.amber),),
          ),
        ),
        InkWell(
            child:Container(
              padding: EdgeInsets.only(top: 10, bottom: 10,),
                child:Icon(Icons.arrow_forward_ios, size:28, color: Colors.grey[500],)
            )
        )

      ],
    );

  }
  Widget _showIfData(String name, String value, Function onPress){
    return SizedBox(
      height: 70,
      child: Expanded(
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  //margin: EdgeInsets.only(right: 290),
                  //alignment: Alignment.centerLeft,
                  width: 350,
                  padding: EdgeInsets.only(left: 15, top: 7, bottom: 7),
                  child: Text(
                      name,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.grey[500])
                  ),
                ),
                Container(
                  width: 350,
                  padding: EdgeInsets.only(left: 15, top: 3, bottom: 10),
                  child: Text(
                      value,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.black)
                  ),
                ),

              ],
            ),

            InkWell(
              onTap: onPress,
              child: Container(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Icon(Icons.edit,size: 28,),
              ),
            )

          ],
        ),
      ),
    );

  }
}
