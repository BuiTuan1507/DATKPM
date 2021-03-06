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
  String password = '1111111';
  bool isEmail = false;
  bool isAdress = false;
  bool isSex = false;
  bool isDateOfBirth = false;
  final _formKey = new GlobalKey<FormState>();

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
      body: Column(
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
                      showNameText(queryData),



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
          (isEmail == true) ?
          (_showData(
              'Email',
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
          (isEmail == true) ?
          (_showData(
              'Ngay sinh cua ban',
                  (){

              }
          )) :
          (_showIfData(
              'Ngay sinh cua ban',
              'tuan@gmail.com',
                  (){

              }
          )),
          Divider(
            color: Colors.grey[400],
            thickness: 1,
          ),
          (isEmail == true) ?
          (_showData(
              'Dia chi',
                  (){

              }
          )) :
          (_showIfData(
              'Dia chi',
              'tuan@gmail.com',
                  (){

              }
          )),
          Divider(
            color: Colors.grey[400],
            thickness: 1,
          ),
          (isEmail == true) ?
          (_showData(
              'Gioi tinh',
                  (){

              }
          )) :
          (_showIfData(
              'Gioi tinh',
              'tuan@gmail.com',
                  (){

              }
          )),
        ],
      ),

    );
  }
  Widget showNameText(queryData){

    return new Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          width: queryData.size.width*0.5,
          child: Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
        ),
        GestureDetector(
          onTap: (){
            isEditName(isEdit);
            //print(2);
          },
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
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
            child: Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.amber),),
          ),
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
