import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/service/Auth.dart';
import 'package:app_giao_do_an/service/BaseAuth.dart';
import 'package:app_giao_do_an/service/root_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
class RegisterScreen extends StatefulWidget {
  String email;
  String password;
  String name;
  String phone;
  BaseAuth auth;
  VoidCallback loginCallback;
  RegisterScreen({Key key, this.email,this.password,this.name,this.phone,this.auth, this.loginCallback}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {



  String errorMessage = '';
  bool isLoading;



  void submit() async {
    setState(() {
      errorMessage = '';
      isLoading = true;
    });

      List <dynamic> friends = List<dynamic>();
      List <dynamic> follow  = List<dynamic>();

      List<dynamic> postId = List<dynamic>();
      String userId = '';
      try {

        String userId = await widget.auth.signUp(widget.email, widget.password);
        setState(() {
          isLoading = false;
        });
        print(widget.email);
        if(widget.auth == null){
          print('null');
        }else{
          print('n');
        }
        print(userId);
        if (userId.length > 0 && userId != null) {
          
          final firestoreInstance = Firestore.instance;
          firestoreInstance.collection('User').document(userId).setData(
            {
              'uuid': userId,
              'email': widget.email,
              'password':widget.password,
              'sex': 0,
              'name':widget.name,

              'imageUser':'https://firebasestorage.googleapis.com/v0/b/appdoan-53f1b.appspot.com/o/ramdom.jpg?alt=media&token=7a7cb060-5d38-4891-8dd2-58a8125f5dd8',
              'address':'',
              'phoneNumber':widget.phone,
              'isOnline': true,

              'timeOnline': DateTime.now(), //time create tk
              'timeUseApp': DateTime.now(),
              'coinApp':0,
              'friends': friends.toList(),
              'followPerson': follow.toList(),
            },
          );
          firestoreInstance.collection('Store').document(userId).setData({
            'idStore':randomAlpha(15),
            'uuid':userId,
            'name':'Chưa có',
            'imageStore':'https://firebasestorage.googleapis.com/v0/b/appdoan-53f1b.appspot.com/o/ramdom.jpg?alt=media&token=7a7cb060-5d38-4891-8dd2-58a8125f5dd8',
            'rating':0,
            'numberPersonRating':0,
            'subRating':0,
            'postId':postId.toList(),
            'description':'Chưa có mô tả',
            'timeCreateStore':DateTime.now(),
            'chatReturn':0
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Bạn đã đăng ký thành công"),

                  actions: [
                    FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }

      } catch (e) {
        setState(() {
          isLoading = false;
          //errorMessage = e.message;

        });
      }

  }
  @override
  void initState() {
    errorMessage = "";
    isLoading = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng ký", style: TextStyle(fontSize: 22, color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 20,bottom: 5,left: 20,right: 20),
                          child: Text("Đăng ký", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29, color: Colors.amber),),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 20,bottom: 5,left: 20,right: 20),
                          child: Text("Tạo tài khoản ngay", style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Colors.black38),),

                        )
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 25),
                  height: 140,
                  width: 180,
                  child: Image.asset("assets/loginLogo.jpg",fit: BoxFit.cover,),
                )
              ],
            ),
            Container(
              height: 15,
            ),

            Container(height: 40,),
            (isLoading)
                ? Center(child: CircularProgressIndicator(),)
                : Container(height: 0, width: 0,),
            InkWell(
                onTap: (){
                  submit();
                },
                child: Container(
                    height: 50,
                    width: queryData.size.width*0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber
                    ),
                    child: Center(
                      child: Text('Đăng ký',
                          style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                    )

                )
            ),
            Container(
              height: 20,
            ),
            InkWell(
              onTap: (){},
              child: Center(
                child: Text("Bằng cách ấn đăng ký, bạn đồng ý với điều khoản của chúng tôi", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18,color: Colors.black),),
              ),
            ),
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 60,right: 10),
                    child: Text("Bạn chưa có tài khoản ?",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),)
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RootPage(auth: widget.auth,)));
                  },
                  child: Center(
                    child: Text("Đăng nhập", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.blue[800]),),
                  ),
                )
              ],
            ),
            (errorMessage.length > 0 && errorMessage != null) ?
            Center(
              child: Text(
                errorMessage, style: TextStyle(
                  fontSize: 14, color: Colors.red, height: 1.0),
              ),
            ) :
            Container(
              height: 0,
            )




          ],
        ),
      ),
    );
  }
}
