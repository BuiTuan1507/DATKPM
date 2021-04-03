import 'package:app_giao_do_an/screen/cart/notification.dart';
import 'package:provider/provider.dart';

import 'controller/provider_controller.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/sell/favorite.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/homeapp/home_app_screen.dart';

import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/order.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/add/personal.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/service/BaseAuth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeApp extends StatefulWidget {
  HomeApp({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomeAppScreen(),
      Order(),
      Favorite(),
      NotificationApp(),
      Personal(auth: widget.auth,logoutCallback: widget.logoutCallback,userId: widget.userId,)
    ];
    return Consumer<ProviderController> (builder: (context,provider,child) {
      provider.getUserOnline(widget.userId);

      return Scaffold(

        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home',),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Bán',style: TextStyle(color: Colors.black),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text('Đăng tin'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Thông báo'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Tôi'),
            ),
          ],
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,

          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(color: Colors.amber[800]),
          unselectedLabelStyle: TextStyle(color:Colors.black),
          onTap: _onItemTapped,
        ),
      );
    }
    );
  }
}