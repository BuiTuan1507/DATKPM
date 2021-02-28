import 'package:flutter/material.dart';
class HomeAppScreen extends StatefulWidget {
  @override
  _HomeAppScreenState createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Text('Home'),
      ),
    );
  }
}
