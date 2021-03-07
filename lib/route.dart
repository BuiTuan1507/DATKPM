

import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/add/change_info.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/login_register/login_screen.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/notificati/notification.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/sell/favorite.dart';
import 'package:app_giao_do_an/hone_app.dart';
import 'package:app_giao_do_an/screen/add/profile.dart';
import 'package:app_giao_do_an/screen/add/update_profile.dart';
import 'package:app_giao_do_an/screen/homeapp/product_type.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/order.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/add/personal.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/login_register/register_screen.dart';
import 'package:flutter/material.dart';

const String HOME_APP = '/homeApp';
const String ORDER = '/order';
const String FAVORITE = '/favorite';
const String NOTIFICATION = '/notification';
const String PERSONAL = '/personal';
const String LOGIN = '/login';
const String REGISTER = '/register';
const String CHANGEINFO = '/changeInfo';
const String PROFILE = '/profile';
const String UPDATEPROFILE  = '/updateProfle';
const String PRODUCTTYPE = '/productType';
class NavService {
  static GlobalKey<NavigatorState> navigatorKey =
  new GlobalKey<NavigatorState>();
  static Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }
}
class RouterNav {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_APP:
        return MaterialPageRoute(builder: (context) => HomeApp());
      case ORDER:
        return MaterialPageRoute(builder: (context) => Order());
      case FAVORITE:
        return MaterialPageRoute(builder: (context) => Favorite());
      case NOTIFICATION:
        return MaterialPageRoute(builder: (context) => NotificationApp());
      case PERSONAL:
        return MaterialPageRoute(builder: (context) => Personal());
      case LOGIN :
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case REGISTER :
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case CHANGEINFO :
        var argument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) =>ChangeInfo(name: argument['name'],email: argument['email'],
          password: argument['password'],address: argument['address'],dateOfBirth:argument['dateOfBirth'],sex: argument['sex'],),);
      case PROFILE :
        return MaterialPageRoute(builder: (context) => Profile());
      case UPDATEPROFILE :
        return MaterialPageRoute(builder: (context) => UpdateProfile());
      case PRODUCTTYPE :
        return MaterialPageRoute(builder: (context) => ProductType());
        default:
        return MaterialPageRoute(builder: (context) => HomeApp());
    }
  }
}
