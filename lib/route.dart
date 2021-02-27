import 'package:app_giao_do_an/hone_app.dart';
import 'package:app_giao_do_an/order.dart';
import 'package:flutter/material.dart';

const String HOME_APP = '/homeApp';
const String ORDER = '/order';

class NavService {
  static final GlobalKey<NavigatorState> navigatorKey =
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
      default:
        return MaterialPageRoute(builder: (context) => Order());
    }
  }
}
