import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class NotificationApp extends StatefulWidget {
  @override
  _NotificationAppState createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Text("notification", style: TextStyle(fontSize: 30),)
          ),
        ));
  }
}
