

import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/add/change_info.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/login_register/login_screen.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/notificati/notification.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/sell/favorite.dart';
import 'package:app_giao_do_an/hone_app.dart';
import 'package:app_giao_do_an/screen/add/profile.dart';
import 'package:app_giao_do_an/screen/add/update_profile.dart';
import 'package:app_giao_do_an/screen/homeapp/cost_catalog.dart';
import 'package:app_giao_do_an/screen/homeapp/electronic_catalog.dart';
import 'package:app_giao_do_an/screen/homeapp/item_electronic_detail.dart';
import 'package:app_giao_do_an/screen/homeapp/priority_catalog.dart';
import 'package:app_giao_do_an/screen/login_register/register_first.dart';
import 'package:app_giao_do_an/screen/login_register/register_name.dart';
import 'package:app_giao_do_an/screen/login_register/register_password.dart';
import 'package:app_giao_do_an/screen/login_register/register_phone.dart';
import 'package:app_giao_do_an/screen/sell/add_post.dart';
import 'package:app_giao_do_an/screen/sell/category_post.dart';
import 'package:app_giao_do_an/screen/sell/contact_infomation.dart';
import 'package:app_giao_do_an/screen/sell/product_infomation.dart';
import 'package:app_giao_do_an/screen/sell/status_product_post.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/homeapp/product/electronic_product_type.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/shop/order.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/add/personal.dart';
import 'file:///C:/Users/Microsoft%20Windows/AndroidStudioProjects/app_giao_do_an/lib/screen/login_register/register_screen.dart';
import 'package:flutter/material.dart';

import 'screen/login_register/register_email.dart';

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
const String ELECTRONICCATALOG= '/electronicCatalog';
const String COSTCATALOG = '/costCatalog';
const String PRIORITYCATALOG = '/priorityCatalog';
const String ITEMELECTRONICDETAIL = '/itemElectronicDetail';
const String PRODUCTINFOMATION = '/productInfomation';
const String CONTACTINFOMATION = '/contactInfomation';
const String ADDPOST = '/addPost';
const String CATEGORYPOST = '/categoryPost';
const String STATUSPRODUCTPOST = '/statusProductPost';

//register
const String REGISTERFIRST = '/registerFirst';
const String REGISTERNAME = '/registerName';
const String REGISTERPHONENUMBER = '/registerPhoneNumber';
const String REGISTEREMAIL = '/registerEmail';
const String REGISTERPASSWORD = '/registerPassword';
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
        var _argument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => Personal(
          logoutCallback: _argument['logoutCallback'], auth: _argument['auth'], userId: _argument['userId'],
        ));
      case LOGIN :
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case CHANGEINFO :
        var _argument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) =>ChangeInfo(userOnline: _argument['user'],sexU: _argument['sex'],),);
      case PROFILE :
        return MaterialPageRoute(builder: (context) => Profile());
      case UPDATEPROFILE :
        var _agrument = settings.arguments as Map ;
        return MaterialPageRoute(builder: (context) => UpdateProfile(password: _agrument['password'],uuid: _agrument['uuid'],));
      case PRODUCTTYPE :
        var argument1 = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => ProductType(catalogF: argument1['catalogF'],));
      case ELECTRONICCATALOG :
        return MaterialPageRoute(builder: (context) => ElectronicCatalog());
      case COSTCATALOG :
        return MaterialPageRoute(builder: (context) => CostCatalog());
      case PRIORITYCATALOG :
        return MaterialPageRoute(builder: (context) => PriorityCatalog());
      case ITEMELECTRONICDETAIL :
        return MaterialPageRoute(builder: (context) => ItemElectronicDetail());
      case CONTACTINFOMATION :
        var _agrument = settings.arguments as Map;

        return MaterialPageRoute(builder: (context) => ContactInfomation(idPost: _agrument['idPost'],selectCategory: _agrument['selectCategory'],
        selectType: _agrument['selectType'],statusProduct: _agrument['statusProduct'],price: _agrument['price'],
          tittleP: _agrument['tittleP'],addressP: _agrument['addressP'],description: _agrument['description'],imageProduct: _agrument['imageProduct']
        ));
      case PRODUCTINFOMATION :
        var _agrument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) =>
            ProductInfomation(selectType:_agrument['selectedType'],selectCategory: _agrument['selectedCategory'],statusProduct:_agrument['statusProduct'] ));
      case ADDPOST :
        var _agrument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) =>
            AddPost(selectType:_agrument['selectedType'],selectCategory: _agrument['selectedCategory'],statusProduct:_agrument['statusProduct'] ,));
      case CATEGORYPOST:
        var _agrument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => CategoryPost(selectedType: _agrument['selectType'],));
      case STATUSPRODUCTPOST :
        var _agrument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => StatusProductPost(selectType:_agrument['selectedType'],selectCategory: _agrument['selectedCategory'],));
      case REGISTERFIRST :
        var _agrument = settings.arguments as Map;

        return MaterialPageRoute(builder: (context) => RegisterFirst(auth: _agrument['auth'],loginCallback: _agrument['loginCallback'],));
      case REGISTEREMAIL :
        var _agrument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => RegisterEmail(auth: _agrument['auth'],loginCallback: _agrument['loginCallback'],));
      case REGISTERNAME :
        var _agrument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => RegisterName(auth: _agrument['auth'],loginCallback: _agrument['loginCallback'],
          email: _agrument['email'],password: _agrument['password'],));
      case REGISTERPHONENUMBER :
        var _agrument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => RegisterPhone(auth: _agrument['auth'],loginCallback: _agrument['loginCallback'],
          email: _agrument['email'],password: _agrument['password'],name: _agrument['name'],));
      case REGISTERPASSWORD :
        var _agrument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => RegisterPassword(auth: _agrument['auth'],loginCallback: _agrument['loginCallback'],email: _agrument['email'],));
      case REGISTER :
        var _agrument = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => RegisterScreen(
          auth: _agrument['auth'],loginCallback: _agrument['loginCallback'],
          email: _agrument['email'],password: _agrument['password'],name: _agrument['name'],phone: _agrument['phone'],
        ));
      default:
        return MaterialPageRoute(builder: (context) => HomeApp());
    }
  }
}
