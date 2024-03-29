import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/sell/favorite.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/homeapp/home_app_screen.dart';
import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/hone_app.dart';
import 'package:app_giao_do_an/model/chat_message.dart';
import 'package:app_giao_do_an/model/chat_room.dart';
import 'package:app_giao_do_an/model/store.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/login_register/login_screen.dart';

import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/order.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/add/profile.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/screen/homeapp/cost_catalog.dart';
import 'package:app_giao_do_an/screen/homeapp/electronic_catalog.dart';
import 'package:app_giao_do_an/screen/homeapp/item_electronic_detail.dart';
import 'package:app_giao_do_an/screen/homeapp/priority_catalog.dart';
import 'package:app_giao_do_an/screen/homeapp/product/vehicle_product_type.dart';
import 'package:app_giao_do_an/screen/login_register/register_screen.dart';
import 'package:app_giao_do_an/service/Auth.dart';
import 'package:app_giao_do_an/service/firebase_service.dart';
import 'package:app_giao_do_an/service/root_page.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/homeapp/product/electronic_product_type.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/add/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/post.dart';

void main() {

  runApp(MyApp(


  ));
}

class MyApp extends StatelessWidget {
  final navigatorKey = NavService.navigatorKey;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firebaseService = FirebaseService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderController(),),
        StreamProvider<List<Post>>.value(value: firebaseService.getPost()),
        StreamProvider<List<Store>>.value(value: firebaseService.getStore()),
        StreamProvider<List<ChatRoom>>.value(value: firebaseService.getChatRoom()),
        StreamProvider<List<ChatMessage>>.value(value: firebaseService.getChatMessage()),
        StreamProvider<List<User>>.value(value: firebaseService.getUser()),

      ],
      child: MaterialApp(
          title: 'Cho BK',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,

          ),
          onGenerateRoute: RouterNav.generateRoute,
          navigatorKey: navigatorKey,
          home:  new RootPage(auth: new Auth()))
    );

  }
}

