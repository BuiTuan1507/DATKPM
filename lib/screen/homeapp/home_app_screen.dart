import 'package:app_giao_do_an/model/item.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
class HomeAppScreen extends StatefulWidget {

  @override
  _HomeAppScreenState createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  ScrollController _scrollController = new ScrollController();
  ScrollController _scrollControllerGrid = new ScrollController();

  List<Post> refreshPost = [];
  List<Post> loadPost = [];
  int get count => loadPost.length;

  TextEditingController searchController;
  Item item1 = new Item('1','nha xa',['assets/h1.jpg'],20,'Ha noi','hêlo','hello','hee',true);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    int down = 0;
    List<Post> x = Provider.of<List<Post>>(context);
    if(x != null){
      for(int i = 0; i<3; i++){
        loadPost.add(x[i]);
      }
    }


    int _count = 3;


    List<Widget> _getItems(List<Post> p) {
      var items = <Widget>[];
      for (int i = _count; i < _count + 1; i++) {
        var item = new Column(
          children: <Widget>[
            showItem(p[_count]),

            Container(height: 20,),
            new Divider(
              height: 2.0,
            )
          ],
        );

        items.add(item);
      }
      return items;
    }
    Future<Null> _handleRefresh() async {
      await new Future.delayed(new Duration(seconds: 2));

      setState(() {
       _count = _count + 2;
      });

      return null;
    }

    // pull down to load more
    void load(){
      print('load');
      setState(() {
        loadPost.clear();
        for(int  i = _count; i< _count + 3; i++){
          loadPost.add(x[i]);
        }
      });
    }

    Future<bool> _loadMore() async {
      print("onLoadMore");

      await Future.delayed(Duration(seconds: 0, milliseconds: 5000));
      load();
      return true;
    }

    Future<void> _refresh() async {
      setState(() {
        _count = _count + 4;
      });
      print('refresh');
      await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
      loadPost.clear();
      load();
    }

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
      body: RefreshIndicator(
        child:  SingleChildScrollView(
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
                            image: AssetImage('assets/home1.jpg'),
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
                            image: AssetImage('assets/home2.jpg'),
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
                            image: AssetImage('assets/home3.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width:15
                    )
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
                              onTap:(){
                                Navigator.pushNamed(context, USERFAVORITE);
                              },
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
                                Navigator.pushNamed(context, USERFRIEND);
                              },
                              child: Container(

                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Center(
                                    child:Icon(Icons.person_add,color: Colors.white,),
                                  )

                              ),
                            )
                            ,
                            Container(
                              child: Text("Bạn bè", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black,),textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, NOTIFICATION);
                              },
                              child: Container(

                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Center(
                                    child:Icon(Icons.save,color: Colors.white,),
                                  )

                              ),
                            ),

                            Container(
                              child: Text("Đơn hàng", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black,),textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, USERHELP);
                              },
                              child: Container(

                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Center(
                                    child:Icon(Icons.help_outline,color: Colors.white,),
                                  )

                              ),
                            )
                            ,
                            Container(
                              child: Text("Trợ giúp", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black,),textAlign: TextAlign.center,),
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
                 // controller: _scrollControllerGrid,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5),
                  crossAxisCount: 4,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.5,
                  children: <Widget>[
                    SizedBox(
                      width: 120,

                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 78,
                              width: 78,
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
             // (x != null) ?
             //    new ListView(
              //    shrinkWrap: true,
             //     scrollDirection: Axis.vertical,
              //    children: _getItems(loadPost),
              //  )

             //  : CircularProgressIndicator(),
              LoadMore(
                isFinish: count >= 6,
                onLoadMore: _loadMore,
                child: ListView.builder(
                 // reverse: true,
                  controller: _scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return showItem(loadPost[index]);
                  },
                  itemCount: count,
                ),

                whenEmptyLoad: false,
                delegate: DefaultLoadMoreDelegate(),
                textBuilder: DefaultLoadMoreTextBuilder.english,
              ),

            ],
          ),
        ),
        onRefresh:  _refresh,
      )

    );
  }

  Widget showItem(Post post){
    var timeJoinApp;
    var createTimeFormat = DateFormat('dd-MM-yyyy');
    timeJoinApp = createTimeFormat.format(post.timeCreate.toDate());
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            padding: EdgeInsets.all(10),
            child:Image.network(post.item.image[0], fit: BoxFit.cover,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10, left:10, bottom: 10, right: 10),
                child: Text(post.item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text('Giá :' + post.item.cost.toString() + 'đ', style: TextStyle(fontSize: 18),),
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(post.addressPost, overflow: TextOverflow.fade,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    child: Text(timeJoinApp, overflow: TextOverflow.fade,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: IconButton(
                      onPressed: (){},
                      icon:Icon( Icons.favorite_border),
                      iconSize: 26,

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: IconButton(
                      onPressed: (){},
                      icon:Icon( Icons.add_shopping_cart),
                      iconSize: 26,

                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
