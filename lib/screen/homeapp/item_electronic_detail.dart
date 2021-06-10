

import 'package:app_giao_do_an/constant.dart';
import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/item.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class ItemElectronicDetail extends StatefulWidget {
  Post post;
  String uuid;
  ItemElectronicDetail({Key key, this.post, this.uuid}) : super(key: key);

  @override
  _ItemElectronicDetailState createState() => _ItemElectronicDetailState();
}

class _ItemElectronicDetailState extends State<ItemElectronicDetail> {
  ScrollController _scrollController = new ScrollController();
  Item item1 = new Item('1', 'nha xa', ['assets/h1.jpg'], 2000000, 'Ha noi',
      'hêlo', 'hello', 'hee', true);

  String _formatMoney(int costSearch) {
    if ((costSearch > 1000) && (costSearch < 1000000)) {
      costSearch = (costSearch / 1000).round();
      return costSearch.toString() + '.000';
    }
    if ((costSearch >= 1000000) && (costSearch < 1000000000)) {
      costSearch = (costSearch ~/ 1000000);
      return costSearch.toString() + '.000' + '.000';
    } else
      return '1';
  }
  void createChatRoom(String buyUuid, String sellUuid, String nameProduct){
    String idChatRoom  = randomAlpha(20);
    bool isReading  = true;

    Timestamp lastTimeRead = Timestamp.fromDate(DateTime.now());
    List<dynamic> chatMessage = List<dynamic>();
    Firestore.instance.collection('ChatRoom').document(idChatRoom).setData({
      'idChatRoom':idChatRoom,
      'isReading':isReading,
      'nameProduct':nameProduct,
      'lastTimeRead':lastTimeRead,
      'buyUuid':buyUuid,
      'sellUuid':sellUuid,
      'chatMessage':chatMessage
    });
  }
  @override
  Widget build(BuildContext context) {
    var createTimeFormat = DateFormat('dd-MM-yyyy');
    var timeJoinApp;

    timeJoinApp = createTimeFormat.format(widget.post.timeCreate.toDate());
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Consumer<ProviderController>(builder: (context, provider, child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black45,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black45,
                size: 28,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 220,
                child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:widget.post.item.image.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.only(
                            left: kDefaultPadding,
                            right: kDefaultPadding,
                            top: kDefaultPadding / 2,
                            bottom: kDefaultPadding / 2,
                          ),
                          width: queryData.size.width * 0.8,
                          height: 185,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.post.item.image[index]),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding:
                    EdgeInsets.only(left: 15, top: 12, right: 12, bottom: 12),
                    child: Text(
                      widget.post.item.name,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 15, bottom: 12),
                          child: Text(
                            _formatMoney(widget.post.item.cost) + ' đ',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 15, bottom: 12),
                          child: Text(timeJoinApp,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[500])),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: queryData.size.width * 0.1,
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 1, color: Colors.red)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 6),
                          child: Text(
                            'Lưu tin',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.red),
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.favorite_border,
                            size: 25,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 2,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/ramdom.jpg'),
                      radius: 25,
                    ),
                  ),
                  SizedBox(
                    width: queryData.size.width * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 6, right: 10),
                          child: Text(
                            'Chưa có ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hoạt động' + ' 1 ' + 'giờ trước',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[400]),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ANOTHERUSER);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.amber),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'Xem trang',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.amber),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: 30, top: 12, bottom: 6, right: 30),
                          child: Text(
                            'Cửa hàng',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.business_center,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                    VerticalDivider(
                      indent: 20,
                      thickness: 2,
                      color: Colors.grey[500],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: 30, top: 12, bottom: 6, right: 30),
                          child: Text('Đánh giá',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text('4.0 ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)),
                            ),
                            Container(
                              child: Icon(
                                Icons.star,
                                size: 24,
                                color: Colors.amber,
                              ),
                            ),
                            Container(
                              child: Text(' (321)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 12, left: 12, right: 12, bottom: 12),
                      child: Text(
                        'Chuyen bán hàng tốt, đảm bảo uy tín',
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
              Container(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Thông tin sản phẩm',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400]),
                    ),
                  ),
                  Container(
                    padding:
                    EdgeInsets.only(left: 10, top: 1, bottom: 10, right: 10),
                    child: Text(
                      widget.post.item.description,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[400],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Khu vực',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400]),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.location_on,
                      size: 25
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Text(widget.post.addressPost,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black45)),
                    ),
                  )
                ],
              ),
              Container(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                            'Tin đăng đã được kiểm duyệt . Nếu gặp bất cứ vấn đề gì, xin vui lòng liên hệ'),
                        TextSpan(
                          text: ' 0922121212',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 21,
                              color: Colors.blue),
                        ),
                      ]),
                ),
              ),
              GestureDetector(
                onTap: (){
                  createChatRoom(widget.uuid, widget.post.uuid, widget.post.item.name);

                  Navigator.pushNamed(context, CHAT);
                  print('add chat room');
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.amber, ),
                  height: queryData.size.height/15,
                  width: queryData.size.width/2,

                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Liên hệ người mua',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
                  )
                ),
              ),
              Container(
                height: 70,
              )
            ],
          ),
        ),
      );
    });

  }
}
