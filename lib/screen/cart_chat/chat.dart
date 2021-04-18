import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/screen/cart_chat/all_chat.dart';
import 'package:app_giao_do_an/screen/cart_chat/buy_chat.dart';
import 'package:app_giao_do_an/screen/cart_chat/sell_chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderController>(builder: (context, provider, child){
      return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Text('Chat', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),),

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
                        child: Text("Tôi mua",style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Tôi bán",style: TextStyle(fontSize: 18)),
                      ),
                    ),

                  ]

              ),
            ),
            body: TabBarView(
              children: [
                BuyChat(uuid: provider.userOnline.uuid,),
                SellChat(uuid: provider.userOnline.uuid,)
              ],
            )
        ),
      );
    },
    );

  }
}
