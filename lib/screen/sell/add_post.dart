import 'package:app_giao_do_an/screen/sell/contact_infomation.dart';
import 'package:app_giao_do_an/screen/sell/product_infomation.dart';
import 'package:flutter/material.dart';
class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text('Đăng tin bán', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),),

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
                      child: Text("Thông tin liên hệ" ,style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Thông tin sản phẩm",style: TextStyle(fontSize: 18)),
                    ),
                  ),

                ]

            ),
          ),
          body: TabBarView(
            children: [
              ProductInfomation(),
              ContactInfomation()
            ],
          )
      ),
    );
  }
}
