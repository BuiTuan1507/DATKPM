import 'package:flutter/material.dart';
class ContactInfomation extends StatefulWidget {
  @override
  _ContactInfomationState createState() => _ContactInfomationState();
}

class _ContactInfomationState extends State<ContactInfomation> {
  String nameUser = 'tuan';
  String phoneNumber = '0923121212';
  String emailUser = 'abc@gmail.com';
  String address = 'Số 1, Mai Động, Hà Nội';
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height:30,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.only(right: 12,left: 12),
                  child: Text('Tên',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(nameUser,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
              ],
            ),
            Divider(
              indent: 12,
              endIndent: 12,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.only(right: 12,left: 12),
                  child: Text('Số điện thoại',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(phoneNumber,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
              ],
            ),
            Divider(
              indent: 12,
              endIndent: 12,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.only(right: 12,left: 12),
                  child: Text('Email',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(emailUser,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
              ],
            ),
            Divider(
              indent: 12,
              endIndent: 12,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.only(right: 12,left: 12),
                  child: Text('Địa chỉ',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.all(12),
                child:Text('Cập nhật lại địa chỉ của bạn', style:TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.blue))

              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(address,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
              ],
            ),
            Divider(
              indent: 12,
              endIndent: 12,
              thickness: 1,
              color: Colors.grey,
            ),
            Container(
              height: 30,
            ),
            InkWell(
                onTap: () {

                },
                child: Container(
                    height: 50,
                    width: queryData.size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber
                    ),
                    child: Center(
                      child: Text('Đăng tin',
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white)),
                    )

                )
            ),
          ],
        ),
      ),
    );
  }
}
