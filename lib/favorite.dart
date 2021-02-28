import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Text("favorite", style: TextStyle(fontSize: 30),)
          ),
        ));
  }
}
