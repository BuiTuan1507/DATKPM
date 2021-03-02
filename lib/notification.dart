import 'package:app_giao_do_an/activity_user.dart';
import 'package:app_giao_do_an/new_infomation.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class NotificationApp extends StatefulWidget {
  @override
  _NotificationAppState createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  int _tinMoi = 0; // so luong tin dang rao

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text('Quản lí tin đăng', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),),
            actions: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.search,size: 28,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.message,size: 28,color: Colors.black,),
                  onPressed: (){},
                ),
              ),
            ],

            bottom: TabBar(

                indicatorColor: Colors.white,
                labelColor: Colors.black45,
                unselectedLabelColor: Colors.black45,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Hoạt động" + "",style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Tin mới" + " (${_tinMoi.toString()})",style: TextStyle(fontSize: 18)),
                    ),
                  ),


                ]

            ),
          ),
          body: TabBarView(
            children: [
              ActivityUser(),
              NewInfomation()
            ],
          )
      ),
    );


  }
}
