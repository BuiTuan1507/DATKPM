import 'package:app_giao_do_an/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Personal extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  String name= "objjur";
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tôi", style: TextStyle(fontSize: 22),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/bg.jpg'),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Container(
                      width: queryData.size.width,
                      height: 180,
                      child: Container(
                        alignment: Alignment(0, 0.5),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/ramdom.jpg'),
                          radius: 80,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600  ),),
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
