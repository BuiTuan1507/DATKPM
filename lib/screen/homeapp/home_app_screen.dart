

import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/item.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

import '../../constant.dart';

class HomeAppScreen extends StatefulWidget {
  String uuid;

  HomeAppScreen({Key key, this.uuid}) : super(key: key);

  @override
  _HomeAppScreenState createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  static const defaultImageString =
      "https://firebasestorage.googleapis.com/v0/b/appdoan-53f1b.appspot.com/o/ramdom.jpg?alt=media&token=07e2217a-dd59-4eee-86ba-29b13a688d69";
  ScrollController _scrollController = new ScrollController();
  ScrollController _scrollControllerGrid = new ScrollController();
  bool isFavorite;

  List<Post> post = [];
  List<Post> loadPost = [];
  int lengthOfPost;
  List<bool> numberOfFavoritePost = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> numberOfShoppingCart = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  TextEditingController searchController;
  Item item1 = new Item('1', 'nha xa', ['assets/h1.jpg'], 20, 'Ha noi', 'hêlo',
      'hello', 'hee', true);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    loadPost = Provider.of<List<Post>>(context);
    void change (bool x){
      setState(() {
        x = !x;
      });
    }
    void createChatUser(User user) {
      String idChatUser = randomAlpha(15);
      List<dynamic> chatRoom = List<dynamic>();
      Firestore.instance.collection('ChatUser').document(idChatUser).setData({
        'idChatUser': idChatUser,
        'uuid': user.uuid,
        'chatRoom': chatRoom.toList()
      });
    }

    void setChatUser(String uuid) {
      Firestore.instance
          .collection('User')
          .document(uuid)
          .updateData({'isChatUser': true});
    }

    return Consumer<ProviderController>(
      builder: (context, provider, child) {
        provider.getStoreUser(widget.uuid);
        provider.getUserOnline(widget.uuid);
        if((provider.favoritePost != null ) && (loadPost != null)){

        }


        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Container(
              margin: EdgeInsets.all(7),
              //padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black54, width: 0.5),
                  color: Colors.white),
              child: TextField(
                controller: searchController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: 'Tìm kiếm',
                  hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                      fontWeight: FontWeight.w400),
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
                    padding: EdgeInsets.only(right: 15, top: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.message,
                        size: 28,
                      ),
                      onPressed: () {
                        if (provider.userOnline != null) {
                          if (provider.userOnline.isChatUser == false) {
                            createChatUser(provider.userOnline);
                            setChatUser(provider.userOnline.uuid);
                          }
                        }
                        Navigator.pushNamed(context, CHAT);
                      },
                      color: Colors.black,
                    ),
                  )),
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
                        onTap: () {},
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
                        onTap: () {},
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
                        onTap: () {},
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
                      Container(width: 15)
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, PROFILE);
                                },
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              Container(
                                child: Text(
                                  "Trang cá nhân",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, USERFAVORITE);
                                },
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              Container(
                                child: Text(
                                  "Tin đã lưu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, NOTIFICATION);
                                },
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Icon(
                                        Icons.save,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              Container(
                                child: Text(
                                  "Đơn hàng",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, USERHELP,arguments: {
                                    'imageUser': provider.imageUser

                                  });
                                },
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Icon(
                                        Icons.help_outline,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              Container(
                                child: Text(
                                  "Trợ giúp",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                  height: 15,
                ),
                Divider(
                  indent: 15,
                  endIndent: 15,
                  thickness: 15,
                  color: Colors.grey[300],
                ),
                Container(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Khám phá sản phẩm",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  height: 15,
                ),
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
                                  child: Image.asset(
                                    'assets/bds.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Container(
                              height: 7,
                            ),
                            Container(
                              child: Text(
                                "Phòng trọ",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ANIMAILPRODUCTTYPE, arguments: {
                            'catalogF': 0,
                            'costSearch': 0,
                          });
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
                                    child: Image.asset(
                                      'assets/doan.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Container(
                                height: 7,
                              ),
                              Container(
                                child: Text(
                                  "Đồ ăn",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PRODUCTTYPE, arguments: {
                            'catalogF': 0,
                            'costSearch': 0,
                          });
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
                                  child: Image.asset(
                                    'assets/dodientu.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 7,
                              ),
                              Container(
                                child: Text(
                                  "Đồ điện tử",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
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
                                child: Image.asset(
                                  'assets/sach.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 7,
                            ),
                            Container(
                              child: Text(
                                "Giáo trình",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, FOODPRODUCTTYPE, arguments: {
                            'catalogF': 0,
                            'costSearch': 0,
                          });
                          print(2);
                        },
                        child:SizedBox(
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
                                  child: Image.asset(
                                    'assets/thu.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 7,
                              ),
                              Container(
                                child: Text(
                                  "Thú cưng",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )
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
                                child: Image.asset(
                                  'assets/vieclam.jpg',
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              height: 7,
                            ),
                            Container(
                              child: Text(
                                "Việc làm",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
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
                                child: Image.asset(
                                  'assets/xe.jpg',
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              height: 7,
                            ),
                            Container(
                              child: Text(
                                "Xe",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
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
                                child: Image.asset(
                                  'assets/dogiadung.jpg',
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              height: 7,
                            ),
                            Container(
                              child: Text(
                                "Đồ gia dụng",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
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
                Container(
                  height: 15,
                ),
                Container(
                  child: Text(
                    "Tin đăng mới",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                // (x != null) ?
                //    new ListView(
                //    shrinkWrap: true,
                //     scrollDirection: Axis.vertical,
                //    children: _getItems(loadPost),
                //  )

                //  : CircularProgressIndicator(),
                (loadPost != null)
                    ? ListView.builder(
                        // reverse: true,
                        controller: _scrollController,
                        shrinkWrap: true,

                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          if(loadPost[index].report != null) {
                            for (int i = 0 ; i< loadPost[index].report.length ; i++){
                              if(widget.uuid == loadPost[index].report[i]){
                                numberOfFavoritePost[index] = true;
                              }
                            }
                          }
                          var timeJoinApp;
                          var createTimeFormat = DateFormat('dd-MM-yyyy');

                          timeJoinApp = createTimeFormat
                              .format(loadPost[index].timeCreate.toDate());
                          return (loadPost[index] != null)
                              ? Container(
                                  child: Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, ITEMELECTRONICDETAIL,
                                              arguments: {
                                                'post': loadPost[index],
                                                'uuid': widget.uuid
                                              });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          height: 120,
                                          width: 120,
                                          padding: EdgeInsets.all(10),
                                          child: Image.network(
                                            (loadPost[index].item.image != null)
                                                ? loadPost[index].item.image[0]
                                                : defaultImageString,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 190,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      top: 10,
                                                      left: 10,
                                                      bottom: 10,
                                                      right: 10),
                                                  child: Text(
                                                    loadPost[index].item.name,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 21,
                                                    ),
                                                  )),
                                              Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: RichText(
                                                    text: TextSpan(children: <
                                                        TextSpan>[
                                                      TextSpan(
                                                          text: 'Giá : ',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .black)),
                                                      TextSpan(
                                                          text: loadPost[index]
                                                              .item
                                                              .cost
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 19,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.red)),
                                                      TextSpan(
                                                          text: ' đ',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .black)),
                                                    ]),
                                                  )),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        queryData.size.width /
                                                            3,
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                        loadPost[index]
                                                            .addressPost,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text(timeJoinApp,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        if(numberOfFavoritePost[index] == false) {
                                                          provider
                                                              .addFavoritePost(
                                                              loadPost[
                                                              index],widget.uuid);


                                                          change(numberOfFavoritePost[index]);
                                                          numberOfFavoritePost[index] = true;
                                                          print(numberOfFavoritePost[index]);

                                                        }else {
                                                          provider.removeFavoritePost(loadPost[index],widget.uuid);

                                                          change(numberOfFavoritePost[index]);
                                                         numberOfFavoritePost[index] = false;
                                                          print(numberOfFavoritePost[index]);
                                                        }


                                                      },
                                                      icon: Icon(Icons
                                                          .favorite_border),
                                                      iconSize: 26,

                                                      color:
                                                          (numberOfFavoritePost[
                                                                      index] ==
                                                                  false
                                                              ? Colors.black
                                                              : Colors.red),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 50, right: 20),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          if(numberOfShoppingCart[index] == false){
                                                            provider.addCart(
                                                                loadPost[index]);
                                                          }

                                                          numberOfShoppingCart[
                                                                  index] =
                                                              !numberOfShoppingCart[
                                                                  index];
                                                        },
                                                        icon: Icon(Icons
                                                            .add_shopping_cart),
                                                        iconSize: 26,
                                                        color:
                                                            (numberOfShoppingCart[
                                                                        index] ==
                                                                    false
                                                                ? Colors.black
                                                                : Colors.blue)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 0,
                                );
                        },
                        itemCount: 8,
                      )
                    : Container(
                        height: 0,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
