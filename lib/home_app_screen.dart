import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
class HomeAppScreen extends StatefulWidget {
  @override
  _HomeAppScreenState createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  TextEditingController searchController;
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
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5,right: 16),
              child: Icon(Icons.message, color: Colors.black54,size: 28,),
            ),
          )

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
                children: <Widget>[
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
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text("Khám phá sản phẩm", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),),
            ),
            Container(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(5),
                crossAxisCount: 4,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/bds.jpg',fit: BoxFit.cover,),
                        ),
                        Container(
                          child: Text("Bất động sản", style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/bds.jpg',fit: BoxFit.cover,),
                        ),
                        Container(
                          child: Text("Bất động sản", style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/bds.jpg',fit: BoxFit.cover,),
                        ),
                        Container(
                          child: Text("Bất động sản", style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,

                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/bds.jpg',fit: BoxFit.cover,),
                        ),
                        Container(
                          child: Text("Bất động sản", style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),

                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
