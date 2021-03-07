import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/needpay.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/onsale.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/other.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/refuse.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int _dangBan = 0; // so luong tin dang rao
  int _tuChoi = 0; // tin dang bi tu choi
  int _canThanhToan = 0; // tin dang can thanh toan khi co nguoi mua

  int _khac = 0 ; //tin bi an
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                      child: Text("Đang bán" + " (${_dangBan.toString()})",style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Bị từ chối" + " (${_tuChoi.toString()})",style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Thanh toán" + " (${_canThanhToan.toString()})",style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Khác" + " (${_khac.toString()})",style: TextStyle(fontSize: 18)),
                    ),
                  ),

                ]

            ),
          ),
          body: TabBarView(
            children: [
              OnSale(),
              RefuseItem(),
              NeedPay(),
              OtherApp()
            ],
          )
      ),
    );


  }
}
