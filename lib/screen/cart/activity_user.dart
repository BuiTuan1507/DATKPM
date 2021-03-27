import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/screen/sell/contact_infomation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ActivityUser extends StatefulWidget {
  @override
  _ActivityUserState createState() => _ActivityUserState();
}

class _ActivityUserState extends State<ActivityUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderController>(
        builder: (context,provider,child){
          return provider.cartPost != null ?
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text('Bạn có ${provider.cartPost.length} đơn hàng'),
                    )
                  ],

                ),
              ) :
              Column(
                children: <Widget>[
                  Container(
                    height: 150,
                  ),
                  Center(
                    child: Text('Bạn chưa có đơn hàng nào', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 19),),
                  )
                ],
              );
        },
      )
    );
  }
}
