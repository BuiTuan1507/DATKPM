import 'package:flutter/material.dart';
class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String name = 'Chưa đặt tên';
  bool isEdit = false;
  String newName = '';
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
                      showNameText(queryData)


                    ],
                  ),
                  )

                ),
              ),
            ],
          )
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
  Widget showNameField(){

    return new Form(
        key: _formKey,
        child: Container(
          child: TextFormField(
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
                  Icons.near_me,
                  size: 26,
                  color: Color(0xFF0C9869),
                )
            ),
            validator: (value) => value.isEmpty ? 'Name không thể trống' : null,
            onSaved: (value) => newName = value.trim(),
          ),
        )
    );
  }
}
