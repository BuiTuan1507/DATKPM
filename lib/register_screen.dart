import 'package:flutter/material.dart';
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = new GlobalKey<FormState>();
  String email;
  String password;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
            Container(
              padding: EdgeInsets.all(12),
              child: new Form(
                  key: _formKey,
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          decoration: new InputDecoration(
                              labelText: 'Nhập Email của bạn',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              icon: new Icon(
                                Icons.mail,
                                size: 26,
                                color: Color(0xFF0C9869),
                              )
                          ),
                          validator: (value) => value.isEmpty ? 'Email không thể trống' : null,
                          onSaved: (value) => email = value.trim(),
                        ),
                      ),
                      Container(height: 10,),
                      Container(
                        child: TextFormField(

                          maxLines: 1,
                          obscureText: _obscureText,
                          autofocus: false,
                          decoration: new InputDecoration(

                              suffixIcon: (_obscureText == true) ? InkWell(onTap: _toggle,child: Icon(Icons.visibility,size: 28,color: Colors.grey,),)
                                  : InkWell(onTap: _toggle,child: Icon(Icons.visibility_off,size: 28,color: Colors.grey,),) ,
                              labelText: 'Nhập mật khẩu',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              icon: new Icon(
                                Icons.lock,
                                size: 26,
                                color: Color(0xFF0C9869),
                              )),
                          validator: (value) => value.isEmpty ? 'Mật khẩu không thể trống' : null,
                          onSaved: (value) => password = value.trim(),
                        ),
                      )
                    ],
                  )
              ),
            ),
            Container(height: 40,),
            InkWell(
                onTap: (){},
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
                  onTap: (){},
                  child: Center(
                    child: Text("Đăng nhập", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.blue[800]),),
                  ),
                )
              ],
            )



          ],
        ),
      ),
    );
  }
}