import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = 'hello';
  int follow = 0;
  int followed = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Trang cá nhân", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),),

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
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,

                        child:Text(name, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.black),textAlign: TextAlign.left,),
                      ),
                      Container(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child:
                            Text('${follow}  Người theo dõi', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                          ),
                          Container(width: 15,),
                          Container(
                            child: Text('${followed}  Đang theo dõi', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                          )
                        ],
                      ),
                      Container(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: (){},
                            child:Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border:Border.all(width: 1, color: Colors.grey[800])
                              ),
                              child: Text('Chỉnh sửa trang cá nhân',style: TextStyle(fontSize: 16),),
                            ),
                          ),
                          Container(width: 15,),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.7,color: Colors.grey[600]),
                                borderRadius: BorderRadius.circular(60)
                              ),
                              child: Icon(Icons.more_horiz,),
                            ),
                          )

                        ],
                      )
                    ],
                  )
              ),

            ],
          ),
          Container(height: 12,),
          Divider(
            thickness: 2,
            color: Colors.grey[300],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15,top: 10,bottom: 7,right: 10),
                child: Icon(Icons.star_border,size: 26,),

              ),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 7,),
                child: Text('Đánh giá',style: TextStyle(fontSize: 17),),
              )
            ],
          )

        ],
      ),
    );
  }
}
