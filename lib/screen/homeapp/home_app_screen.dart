import 'package:app_giao_do_an/model/item.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
class HomeAppScreen extends StatefulWidget {

  @override
  _HomeAppScreenState createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  TextEditingController searchController;
  Item item1 = new Item('1','nha xa','assets/h1.jpg',20,'Ha noi',true);
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.amber,
        title: Container(

          margin: EdgeInsets.all(7),
          //padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black54,width: 0.5),
            color: Colors.white
          ),
          child: TextField(

            controller: searchController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(

              prefixIcon : Icon(Icons.search, color: Colors.black,),
            hintText: 'Tìm kiếm',
              hintStyle: TextStyle(fontSize: 18, color: Colors.black45, fontWeight: FontWeight.w400),
                focusedBorder: OutlineInputBorder(

            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),

              ),

            ),
        ),
      ),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            child: Container(
              padding: EdgeInsets.only(right: 15,top: 5),
              child: IconButton(
                icon: Icon(Icons.message,size: 28,),

                onPressed: (){},
                color: Colors.black,
              ),
            )

          ),


        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(
                    left: kDefaultPadding,
                    top: kDefaultPadding / 2,
                    bottom: kDefaultPadding / 2,
                  ),
                  width: queryData.size.width * 0.8,
                  height: 185,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/h1.jpg'),
                    ),
                  ),
                ),
              ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.only(
                        left: kDefaultPadding,
                        top: kDefaultPadding / 2,
                        bottom: kDefaultPadding / 2,
                      ),
                      width: queryData.size.width * 0.8,
                      height: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/h2.jpg'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.only(
                        left: kDefaultPadding,
                        top: kDefaultPadding / 2,
                        bottom: kDefaultPadding / 2,
                      ),
                      width: queryData.size.width * 0.8,
                      height: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/h2.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 15,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap:(){
                            Navigator.pushNamed(context,PROFILE );
                          },
                          child:Container(

                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(
                                child:Icon(Icons.person,color: Colors.white,),
                              )

                          ),
                        ),

                        Container(
                          child: Text("Trang cá nhân", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black,),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap:(){},
                          child: Container(

                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(
                                child:Icon(Icons.favorite,color: Colors.white,),
                              )

                          ),
                        ),
                        Container(
                          child: Text("Tin đã lưu", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black,),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap:(){

                          },
                          child: Container(

                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(
                                child:Icon(Icons.person,color: Colors.white,),
                              )

                          ),
                        )
                        ,
                        Container(
                          child: Text("Trang cá nhân", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black,),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Container(

                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(
                              child:Icon(Icons.person,color: Colors.white,),
                            )

                        ),
                        Container(
                          child: Text("Trang cá nhân", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black,),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Container(

                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(
                              child:Icon(Icons.person,color: Colors.white,),
                            )

                        ),
                        Container(
                          child: Text("Trang cá nhân", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black,),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Container(

                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Center(
                              child:Icon(Icons.person,color: Colors.white,),
                            )

                        ),
                        Container(
                          child: Text("Trang cá nhân", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black,),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),


                ],
              )
            ),
            Container(height: 15,),
            Divider(
              indent: 15,
              endIndent: 15,
              thickness: 15,
              color: Colors.grey[300],
            ),
            Container(height: 15,),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text("Khám phá sản phẩm", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.left,),
            ),
            Container(height: 15,),
            Container(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(5),
                crossAxisCount: 4,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 0.6,
                children: <Widget>[
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('assets/bds.jpg',fit: BoxFit.cover,),
                          )

                        ),
                        Container(height: 7,),
                        Container(
                          child: Text("Phòng trọ", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('assets/doan.jpg',fit: BoxFit.cover,),
                          )
                          
                        ),
                        Container(height: 7,),
                        Container(
                          child: Text("Đồ ăn", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, PRODUCTTYPE,arguments: {'catalogF':0});
                      print(2);
                    },
                    child: SizedBox(
                      width: 120,

                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),

                              child:  Image.asset('assets/dodientu.jpg',fit: BoxFit.cover,),
                            ),
                          ),
                          Container(height: 7,),
                          Container(
                            child: Text("Đồ điện tử", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                          ) ,


                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('assets/sach.jpg',fit: BoxFit.cover,),
                          ) 
                          ,
                        ),
                        Container(height: 7,),
                        Container(
                          child: Text("Giáo trình", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('assets/thu.jpg',fit: BoxFit.cover,),
                          )
                          ,
                        ),
                        Container(height: 7,),
                        Container(
                          child: Text("Thú cưng", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            child: Image.asset('assets/vieclam.jpg',fit: BoxFit.cover,),
                            borderRadius: BorderRadius.circular(20),
                          ) 
                          ,
                        ),
                        Container(height: 7,),
                        Container(
                          child: Text("Việc làm", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            child: Image.asset('assets/xe.jpg',fit: BoxFit.cover,),
                            borderRadius: BorderRadius.circular(20),
                          ) 
                          ,
                        ),
                        Container(height: 7,),
                        Container(
                          child: Text("Xe", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            child: Image.asset('assets/dogiadung.jpg',fit: BoxFit.cover,),
                            borderRadius: BorderRadius.circular(20),
                          ) 
                         ,
                        ),
                        Container(height: 7,),
                        Container(
                          child: Text("Đồ gia dụng", style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                ],

              ),
            ),
            Container(
              height: 15,

            ),
            Divider(
              indent: 5,
              endIndent: 5,
              thickness: 15,
              color: Colors.grey[300],
            ),
            Container(height: 15,),
            Container(
              child: Text(
                "Tin đăng mới", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Container(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(5),
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 0.9,
                children: <Widget>[
                  showItem(item1),
                  showItem(item1),
                  showItem(item1),
                  showItem(item1),
                ],
              )
            )

          ],
        ),
      ),
    );
  }
  Widget showItem(Item item){
    return new Card(
      margin: EdgeInsets.all(6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black)
      ),
      color: Colors.white,
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Color(0xFFEFDB)),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.cover

                    )
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding:EdgeInsets.only(left: 15),
                        child: Text(item.name, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400, color: Colors.black),textAlign: TextAlign.left,),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                       Container(
                         padding:EdgeInsets.only(left: 15),
                         child: Text(item.cost.toString() + ' tỷ'  ,style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold,color:Colors.red),),
                       ),
                      Container(width: 25,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                       child: IconButton(
                         icon: Icon(Icons.favorite),
                         iconSize: 24,
                          onPressed: (){},
                       ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          padding:EdgeInsets.only(left: 15),
                        child:Text("20h truoc",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)
                      ),
                      Container(
                        width: 20,
                      ),
                      Container(
                        child: Text(item.address,style: TextStyle(fontSize: 19),overflow: TextOverflow.fade,),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}