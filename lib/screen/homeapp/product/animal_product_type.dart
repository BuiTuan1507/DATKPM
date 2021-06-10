

import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/item.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/screen/homeapp/item_electronic_detail.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimalProductType extends StatefulWidget {
  String hintSearchText;
  int catalogF = 0;
  int costSearch;
  int priority;

  AnimalProductType({Key key, this.catalogF, this.costSearch, this.priority}) : super(key: key);

  @override
  _AnimalProductTypeState createState() => _AnimalProductTypeState();
}

class _AnimalProductTypeState extends State<AnimalProductType> {
  ScrollController _scrollController = new ScrollController();

  static const defaultImageString =
      "https://firebasestorage.googleapis.com/v0/b/appdoan-53f1b.appspot.com/o/ramdom.jpg?alt=media&token=07e2217a-dd59-4eee-86ba-29b13a688d69";
  bool isFavorite = false;
  var catalogE = [
    'Thú cưng',
    'Điện thoại',
    'Máy tính bảng',
    'Lap top',
    'Máy tính để bàn',
    'Phụ kiện'
  ];
  String loadPriority (int priority){
    switch(priority) {
      case 0 :
        return 'Tất cả';
        break;
      case 1 :
        return 'Ưu tiên';
        break;
      case 2 :
        return 'Không ưu tiên';
    }
  }
  Item item1 = new Item('1', 'nha xa', ['assets/h1.jpg'], 20, 'Ha noi', 'hêlo',
      'hello', 'hee', true);
  Item ir = new Item('2', 'bánh',['assets/h1.jpg'], 20, 'Ha noi', 'hêlo',
      'hello', 'hee', true);

  @override
  Widget build(BuildContext context) {
   List<Post> x = [];
    List<Post> a = Provider.of<List<Post>>(context);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    TextEditingController _searchController;

    return Consumer<ProviderController>(
      builder:(context,provider, child){
        if(a != null){
          for (int i = 0 ; i< a.length; i++){
            if(a[i].item.type  == "t"){
              x.add(a[i]);
            }

          }
        }
        List<Post> _product = [];
        if( a != null ){
          for (int i = 0 ; i<x.length ; i++){
            _product.add(a[i]);
          }
        }

        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.amber,
              title: Container(
                margin: EdgeInsets.all(7),
                //padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black54, width: 0.5),
                    color: Colors.white),
                child: TextField(
                  controller: _searchController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    //hintText: widget.hintSearchText,
                    hintText: catalogE[widget.catalogF],
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
                          Icons.forum,
                          size: 28,
                        ),
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: 12, left: 12, bottom: 12, right: 7),
                        padding: EdgeInsets.only(
                            top: 10, left: 10, bottom: 10, right: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black45, width: 1)),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, ELECTRONICCATALOG);
                              },
                              child: Container(
                                child: Text(
                                  catalogE[widget.catalogF],
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 28,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                        EdgeInsets.only(left: 5, top: 12, bottom: 12, right: 6),
                        padding: EdgeInsets.only(
                            top: 10, left: 10, bottom: 10, right: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black45, width: 1)),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, COSTCATALOG);
                              },
                              child: Container(
                                child: (widget.costSearch == 0)
                                    ? Text(
                                  'Giá',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                                    : Column(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        'Giá',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                          widget.costSearch.toString(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.add,
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12, bottom: 12, left: 6),
                        padding: EdgeInsets.only(
                            top: 10, left: 10, bottom: 10, right: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black45, width: 1)),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, PRIORITYCATALOG);
                              },
                              child:((widget.priority) == null) ? Container(
                                child: Text(
                                  'Ưu tiên',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ) : Container(
                                child: Text(
                                  loadPriority(widget.priority),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.add,
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[500],
                  ),

                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.home,
                          color: Colors.amber,
                          size: 26,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12, bottom: 12, left: 2),
                        child: Text(
                          'Quầy hàng thú cưng',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.amber,
                              fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            'Xem thông tin',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.amber),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                  ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _product.length,
                      itemBuilder: (context, index) {

                        return Container(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ITEMELECTRONICDETAIL,arguments: {'post':_product[index],'uuid':provider.userOnline.uuid});
                                },
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: (_product[index].item.image != null) ? Image.network(

                                      _product[index].item.image[0],
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 140,
                                    ) : Image.network(

                                      defaultImageString,
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 140,
                                    ) ,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 15,
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        _product[index].item.name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black45),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.only(left: 15, bottom: 10),
                                      child: Text(
                                        _product[index].item.cost.toString() + ' đ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 19),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[

                                        Container(
                                          width: 150,
                                          padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                          child: Text(
                                            _product[index].addressPost,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        (isFavorite == true)
                                            ? IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        )
                                            : IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.black45,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
            ));
      },
    );

  }
}
