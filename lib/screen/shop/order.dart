import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/needpay.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/onsale.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/other.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/refuse.dart';
import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/store.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  static const defaultImageString =
      "https://firebasestorage.googleapis.com/v0/b/appdoan-53f1b.appspot.com/o/ramdom.jpg?alt=media&token=07e2217a-dd59-4eee-86ba-29b13a688d69";
  @override
  Widget build(BuildContext context) {
    List<Post> x = Provider.of<List<Post>>(context);

    Store store ;

    return Consumer<ProviderController>(
      builder: (context, provider, child){
        provider.getStoreUser(provider.userOnline.uuid);
        if(provider.userStore != null){
          store = provider.userStore;
        }

        List<Post> _sales = [];
        List<Post> _refuse = [];
        List<Post> _needPay = [];
        List<Post> _other = [];//hidden post
        for (int i = 0; i< x.length; i++){
          if(x[i].statusPost == 0){
            _sales.add(x[i]);
          }else if(x[i].statusPost == 1){
            _refuse.add(x[i]);
          }else if( x[i].statusPost == 2 ){
            _needPay.add(x[i]);
          }else if( x[i].statusPost == 3){
            _other.add(x[i]);
          }
        }
        int _dangBan = 0; // so luong tin dang rao
        int _tuChoi = 0; // tin dang bi tu choi
        int _canThanhToan = 0; // tin dang can thanh toan khi co nguoi mua

        int _khac = 0 ; //tin bi an
        if(_sales != null){
          _dangBan = _sales.length;
        }
        if(_refuse != null){
          _tuChoi = _refuse.length;
        }
        if(_needPay != null){
          _canThanhToan = _needPay.length;
        }
        if(_other != null){
          _khac = _other.length;
        }

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
                    onPressed: (){
                      Navigator.pushNamed(context, SEARCHPOST);
                    },
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.message,size: 28,color: Colors.black,),
                    onPressed: (){
                      Navigator.pushNamed(context, CHAT);
                    },
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
            body:(x != null) ? Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 10, top: 15),
                      child: CircleAvatar(
                        backgroundImage: (store != null) ? NetworkImage(store.imageStore) : NetworkImage(defaultImageString),
                        radius: 40,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: (store != null ) ? Text(store.name) : Text("Chưa có tên", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                          ),
                          Container(
                            height: 10,
                          ),
                          Container(
                            child: (store != null) ?  Text(store.description) : Text("Chưa có mô tả", textAlign: TextAlign.center,),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child:TabBarView(
                    children: [
                      OnSale(salePost: _sales,),
                      RefuseItem(refuse: _refuse,),
                      NeedPay(needPay: _needPay,),
                      OtherApp(other: _other,)
                    ],
                  )
                ),

              ],
            ) : Center(child: Container(
              padding: EdgeInsets.only(top:80),
              child:Text('Bạn chưa có bán sản phẩm nào', style: TextStyle(fontSize: 18,),textAlign: TextAlign.center,)
            ),),

          ),
        );

      },
    );


  }
}
