import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Chọn danh mục tin đăng', style: TextStyle(
            fontSize: 23, fontWeight: FontWeight.w500, color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

           Row(
             children: <Widget>[

               Container(
                 padding: EdgeInsets.only(left: 20,top: 10, bottom: 7, right:20 ),
                 child: Icon(Icons.home,size: 33,color: Colors.black45,),
               ),
               Container(
                 width: queryData.size.width*0.72,
                 padding: EdgeInsets.only(top: 10,bottom: 7),
                 child: Text("Phòng trọ",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
               ),
               InkWell(
                 onTap: (){
                   Navigator.pushNamed(context, CATEGORYPOST,arguments: {'selectType':1});
                 },
                 child: Container(

                   child: Icon(Icons.arrow_forward_ios, size: 24,color: Colors.black45,),
                 ),
               )
             ],
           ),

            Divider(
              endIndent: 5,
              indent: 5,
              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(left: 20,top: 10, bottom: 7, right:20 ),
                  child: Icon(Icons.directions_car,size: 33,color: Colors.black45,),
                ),
                Container(
                  width: queryData.size.width*0.72,
                  padding: EdgeInsets.only(top: 10,bottom: 7),
                  child: Text("Xe cộ",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CATEGORYPOST,arguments: {'selectType': 2});
                  },
                  child: Container(

                    child: Icon(Icons.arrow_forward_ios, size: 24,color: Colors.black45,),
                  ),
                )
              ],
            ),

            Divider(
              endIndent: 5,
              indent: 5,
              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(left: 20,top: 10, bottom: 7, right:20 ),
                  child: Icon(Icons.phone_iphone,size: 33,color: Colors.black45,),
                ),
                Container(
                  width: queryData.size.width*0.72,
                  padding: EdgeInsets.only(top: 10,bottom: 7),
                  child: Text("Đồ điện tử",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CATEGORYPOST,arguments: {'selectType':4});
                  },
                  child: Container(

                    child: Icon(Icons.arrow_forward_ios, size: 24,color: Colors.black45,),
                  ),
                )
              ],
            ),

            Divider(
              endIndent: 5,
              indent: 5,
              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(left: 20,top: 10, bottom: 7, right:20 ),
                  child: Icon(Icons.book,size: 33,color: Colors.black45,),
                ),
                Container(
                  width: queryData.size.width*0.72,
                  padding: EdgeInsets.only(top: 10,bottom: 7),
                  child: Text("Giáo trình",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CATEGORYPOST,arguments: {'selectType':8});
                  },
                  child: Container(

                    child: Icon(Icons.arrow_forward_ios, size: 24,color: Colors.black45,),
                  ),
                )
              ],
            ),

            Divider(
              endIndent: 5,
              indent: 5,
              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(left: 20,top: 10, bottom: 7, right:20 ),
                  child: Icon(Icons.pets,size: 33,color: Colors.black45,),
                ),
                Container(
                  width: queryData.size.width*0.72,
                  padding: EdgeInsets.only(top: 10,bottom: 7),
                  child: Text("Thú cưng",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CATEGORYPOST,arguments: {'selectType':3});
                  },
                  child: Container(

                    child: Icon(Icons.arrow_forward_ios, size: 24,color: Colors.black45,),
                  ),
                )
              ],
            ),

            Divider(
              endIndent: 5,
              indent: 5,
              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(left: 20,top: 10, bottom: 7, right:20 ),
                  child: Icon(Icons.store,size: 33,color: Colors.black45,),
                ),
                Container(
                  width: queryData.size.width*0.72,
                  padding: EdgeInsets.only(top: 10,bottom: 7),
                  child: Text("Đồ gia dụng",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CATEGORYPOST,arguments: {'selectType':6});
                  },
                  child: Container(

                    child: Icon(Icons.arrow_forward_ios, size: 24,color: Colors.black45,),
                  ),
                )
              ],
            ),

            Divider(
              endIndent: 5,
              indent: 5,
              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(left: 20,top: 10, bottom: 7, right:20 ),
                  child: Icon(Icons.fastfood,size: 33,color: Colors.black45,),
                ),
                Container(
                  width: queryData.size.width*0.72,
                  padding: EdgeInsets.only(top: 10,bottom: 7),
                  child: Text("Đồ ăn",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CATEGORYPOST,arguments: {'selectType': 5});
                  },
                  child: Container(

                    child: Icon(Icons.arrow_forward_ios, size: 24,color: Colors.black45,),
                  ),
                )
              ],
            ),

            Divider(
              endIndent: 5,
              indent: 5,
              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(left: 20,top: 10, bottom: 7, right:20 ),
                  child: Icon(Icons.work,size: 33,color: Colors.black45,),
                ),
                Container(
                  width: queryData.size.width*0.72,
                  padding: EdgeInsets.only(top: 10,bottom: 7),
                  child: Text("Việc làm",style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CATEGORYPOST,arguments: {'selectType':8});
                  },
                  child: Container(

                    child: Icon(Icons.arrow_forward_ios, size: 24,color: Colors.black45,),
                  ),
                )
              ],
            ),

            Divider(
              endIndent: 5,
              indent: 5,
              thickness: 1,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}