import 'package:flutter/material.dart';
class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String name = 'Chưa đặt tên';
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(width: 0.5,color: Colors.grey[500])
                  ),
                  child: SizedBox(
                    height: 120,
                    width: queryData.size.width*0.65,
                  child: Column(
                    children: <Widget>[
                      Container(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Họ và tên",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.grey[400]),),
                      ),
                      Container(
                        height: 7,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: queryData.size.width*0.4,
                            child: Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                          ),
                          Container(
                            child: Icon(Icons.edit,size: 28, color: Colors.grey[600],),
                          )
                        ],
                      )

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
}
