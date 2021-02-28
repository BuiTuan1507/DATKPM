import 'package:app_giao_do_an/notification.dart';
import 'package:app_giao_do_an/favorite.dart';
import 'package:app_giao_do_an/hone_app.dart';
import 'package:app_giao_do_an/order.dart';
import 'package:app_giao_do_an/personal.dart';
import 'package:flutter/material.dart';

const String HOME_APP = '/homeApp';
const String ORDER = '/order';
const String FAVORITE = '/favorite';
const String NOTIFICATION = '/notification';
const String PERSONAL = '/personal';

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

      default:
        return MaterialPageRoute(builder: (context) => HomeApp());
    }
  }
}
