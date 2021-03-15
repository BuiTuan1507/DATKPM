import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/screen/sell/contact_infomation.dart';
import 'package:flutter/material.dart';
class ProductInfomation extends StatefulWidget {
  String selectType;
  String selectCategory;
  String statusProduct;
  ProductInfomation({Key key, this.selectType, this.selectCategory, this.statusProduct})
      : super(key: key);
  @override
  _ProductInfomationState createState() => _ProductInfomationState();
}

class _ProductInfomationState extends State<ProductInfomation> {
  TextEditingController tittleProduct = TextEditingController();
  TextEditingController addressProduct = TextEditingController();
  TextEditingController priceProduct = TextEditingController();
  TextEditingController descriptionProduct = TextEditingController();
  String tittleP ;
  String addressP;

  String description ;
  int price;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Thông tin sản phẩm', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
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
                  padding: EdgeInsets.only(left: 12,right: 12,top: 12),
                  child: Text('Tiêu đề sản phẩm',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            Container(
              height:45,
              width: queryData.size.width*0.9,
              margin: EdgeInsets.only(right: 12),
              child: TextField(

                maxLines: 1,
                maxLength: 50,

                controller: tittleProduct,
                onChanged: (t){
                  tittleP = t;
                },
                style: TextStyle(
                  fontSize: 18
                ),

              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.only(right: 12,left: 12),
                  child: Text('Danh mục',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(widget.selectType,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
              ],
            ),

            Divider(
              indent: 12,
              endIndent: 24,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.only(right: 12,left: 12),
                  child: Text('Loại',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(widget.selectCategory,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
              ],
            ),

            Divider(
              indent: 12,
              endIndent: 24,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.only(left: 12,right: 12,top: 12),
                  child: Text('Nơi giao dịch',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            Container(
              height:45,
              width: queryData.size.width*0.9,
              margin: EdgeInsets.only(right: 12),
              child: TextField(

                maxLines: 2,
                maxLength: 100,

                controller: addressProduct,
                onChanged: (t){
                  addressP = t;
                },
                style: TextStyle(
                    fontSize: 18
                ),

              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.only(left: 12,right: 12,top: 6),
                  child: Text('Giá',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            Container(
              height:25,
              width: queryData.size.width*0.9,
              margin: EdgeInsets.only(right: 12),
              child: TextField(

                maxLines: 1,
                keyboardType: TextInputType.number,

                controller: priceProduct,
                onChanged: (t){
                  price = t as int;
                },
                style: TextStyle(
                    fontSize: 18
                ),

              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.all(12),
                  child: Text('Tình trạng',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
              ],
            ),


            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(widget.statusProduct,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                ),
              ],
            ),

            Divider(
              indent: 12,
              endIndent: 24,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width*0.6,
                  padding: EdgeInsets.only(left: 12,right: 12,top: 6),
                  child: Text('Mô tả',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ],
            ),
            Container(
              height:45,
              width: queryData.size.width*0.9,
              margin: EdgeInsets.only(right: 12),
              child: TextField(

                maxLines: 10,


                controller: descriptionProduct,
                onChanged: (t){
                  description = t ;
                },
                style: TextStyle(
                    fontSize: 18
                ),

              ),
            ),
            Container(height: 50,),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CONTACTINFOMATION,
                      arguments: {'tittleP':tittleP,'addressP':addressP,'description':description,
                      'price':price,'selectType':widget.selectType,'selectCategory':widget.selectCategory,'selectProduct':widget.statusProduct
                      });
                },
                child: Container(
                    height: 50,
                    width: queryData.size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber
                    ),
                    child: Center(
                      child: Text('Thông tin liên lạc',
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
