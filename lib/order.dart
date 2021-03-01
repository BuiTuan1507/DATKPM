import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quản lí tin đăng', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),),
          actions: [
            Container(
              child: IconButton(
                icon: Icon(Icons.search,size: 28,),
                onPressed: (){},
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.message,size: 28,),
                onPressed: (){},
              ),
            ),
          ],
          bottom: TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.white,
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
                    child: Text("Đơn hàng"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Đang giao"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Đã giao"),
                  ),
                ),

              ]

          ),
        ),
        body: TabBarView(
          children: [

          ],
        )
      ),
    );

  }
}
