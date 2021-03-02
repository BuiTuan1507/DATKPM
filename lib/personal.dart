import 'package:app_giao_do_an/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  String name= "objjur";
  int point = 0;
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Chức năng khác", style: TextStyle(fontSize: 22, color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(

          child: Column(

            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10 , top: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/ramdom.jpg'),
                      radius: 40,
                    ),
                  ),
                  Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child:Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),

                          ),

                          Divider(

                            indent: 10,
                            endIndent: 10,
                            thickness: 0.5,
                            color: Colors.black54,
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Điểm đánh giá của tôi : 80", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),)
                          )

                        ],
                      )
                  ),


                ],
              ),
              Divider(
                indent: 5,
                endIndent: 5,
                thickness: 0.5,
                color: Colors.black54,
              ),
              Container(height: 5,),
              Row(
                children: <Widget>[
                  Container(width: 15,),
                  Container(

                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child:Icon(Icons.person,color: Colors.white,),
                      )

                  ),
                  Container(width: 20,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Trang cá nhân", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  )
                ],
              ),
              Container(height: 10,),
              Row(
                children: <Widget>[
                  Container(width: 15,),
                  Container(

                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child:Icon(Icons.favorite,color: Colors.white,),
                      )

                  ),
                  Container(width: 20,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Tin đăng đã lưu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  )
                ],
              ),
              Container(height: 10,),
              Row(
                children: <Widget>[
                  Container(width: 15,),
                  Container(

                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child:Icon(Icons.person_add,color: Colors.white,),
                      )

                  ),
                  Container(width: 20,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Bạn bè", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  )
                ],
              ),
              Container(height: 10,),
              Row(
                children: <Widget>[
                  Container(width: 15,),
                  Container(

                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child:Icon(Icons.save,color: Colors.white,),
                      )

                  ),
                  Container(width: 20,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Lịch sử giao dịch", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  )
                ],
              ),
              Container(height: 10,),
              Divider(
                indent: 5,
                endIndent: 5,
                thickness: 0.5,
                color: Colors.black54,
              ),
              Container(height: 10,),
              Row(
                children: <Widget>[
                  Container(width: 15,),
                  Container(

                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child:Icon(Icons.store,color: Colors.white,),
                      )

                  ),
                  Container(width: 20,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Tạo cửa hàng", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  )
                ],
              ),
              Container(height: 10,),
              Row(
                children: <Widget>[
                  Container(width: 15,),
                  Container(

                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child:Icon(Icons.speaker_group,color: Colors.white,),
                      )

                  ),
                  Container(width: 20,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Khuyến mãi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  )
                ],
              ),
              Container(height: 10,),
              Row(
                children: <Widget>[
                  Container(width: 15,),
                  Container(

                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child:Icon(Icons.help,color: Colors.white,),
                      )

                  ),
                  Container(width: 20,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Trợ giúp", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  )
                ],
              ),
              Container(height: 10,),
              Row(
                children: <Widget>[
                  Container(width: 15,),
                  Container(

                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child:Icon(Icons.settings,color: Colors.white,),
                      )

                  ),
                  Container(width: 20,),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Cài đặt", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  )
                ],
              ),
              Container(height: 10,),
              Row(
                children: <Widget>[
                  Container(width: 15,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, LOGIN);
                    },
                    child: Container(

                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Center(
                          child:Icon(Icons.exit_to_app,color: Colors.white,),
                        )

                    ),
                  ),

                  Container(width: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, LOGIN);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("Đăng xuất", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    ),
                  ),

                ],
              ),
              Container(height: 10,),

            ],
          ),
      ),
    );
  }
}
