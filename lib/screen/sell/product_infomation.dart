import 'package:app_giao_do_an/screen/sell/contact_infomation.dart';
import 'package:flutter/material.dart';
class ProductInfomation extends StatefulWidget {
  @override
  _ProductInfomationState createState() => _ProductInfomationState();
}

class _ProductInfomationState extends State<ProductInfomation> {
  TextEditingController tittleProduct = TextEditingController();
  String tittleP ;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(20),
                width: queryData.size.width,
                height: queryData.size.height*0.28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1,color: Colors.black45)
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 20,
                    ),
                    Center(

                      child: Icon(Icons.photo_camera,size: 40,color: Colors.amber,),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Tải hình ảnh của sản phẩm ở đây',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 6,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.all(12),
                  child: Text('Tiêu đề sản phẩm',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey),),
                ),
              ],
            ),
            Container(
              width: queryData.size.width*0.8,
              margin: EdgeInsets.only(right: 12),
              child: TextField(

                maxLines: 3,
                maxLength: 50,

                controller: tittleProduct,
                onChanged: (t){
                  tittleP = t;
                },
                style: TextStyle(
                  fontSize: 18
                ),

              ),
            )


          ],
        ),
      ),
    );
  }
}
