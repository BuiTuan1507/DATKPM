import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String name = 'Chưa đặt tên';
  bool isEdit = false;
  String newName = '';
  String phoneNumber = '093821232';
  String email = '';
  String address = '';
  int sex = 0; // 0 chua dien , 1 la nam, 2 la nu, 3 la khong muon tiet lo
  String dateOfBirth = '';
  String password = '11111111';
  bool isEmail = false;
  bool isAdress = false;
  bool isSex = false;
  bool isDateOfBirth = false;
  String hidenPassword = '';
  String star = '*';
  bool isHiddenPassword = false;
  @override
  void initState() {
    // TODO: implement initState
    for(int i = 0; i< password.length; i++){
      hidenPassword = hidenPassword + star;
    }
    super.initState();
  }
  final _formKey = new GlobalKey<FormState>();
  FisHiddenPassword(bool isHiddenPassword){

    setState(() {
      print(1);
      isHiddenPassword = !isHiddenPassword;
    });
    print(isHiddenPassword);
  }
  isEditName(bool isEdit){

    setState(() {
      isEdit = !isEdit;
      //print('hello');
    });

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

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
                    backgroundImage: AssetImage('assets/ramdom.jpg'),
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
                            showNameText(queryData,
                                    (){

                                  Navigator.pushNamed(context, CHANGEINFO,arguments:{'email':email,'name':name,'dateOfBirth':dateOfBirth,'address':address,'sex':sex,'password':password} );
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
                      child: Text(phoneNumber, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),),
                    )
                  ],
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            (isEmail == false) ?
            (_showData(
                'Thêm Email',
                    (){

                }
            )) :
            (_showIfData(
                'Email',
                'tuan@gmail.com',
                    (){

                }
            )),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
            (isEmail == false) ?
            (_showData(
                'Thêm ngày sinh của bạn',
                    (){

                }
            )) :
            (_showIfData(
                'Ngày sinh của bạn',
                'tuan@gmail.com',
                    (){

                }
            )),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
            (isEmail == false) ?
            (_showData(
                'Thêm địa chỉ',
                    (){

                }
            )) :
            (_showIfData(
                'Địa chỉ',
                'Số 1, Minh Khai, Hoàng Mai',
                    (){

                }
            )),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
            (isEmail == false) ?
            (_showData(
                'Thêm giới tính',
                    (){

                }
            )) :
            (_showIfData(
                'Giới tính',
                'Nam',
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
  }
  Widget showNameText(queryData,Function onPress){

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
