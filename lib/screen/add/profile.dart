import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController _scrollController = new ScrollController();
  String feedback = '0';

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderController>(builder: (context, provider, child) {
      Stream<List<Post>> x = provider.getPostUser(provider.userOnline.uuid);
      //  print(x.listen((event) {print(event[0].nameUserPost);}));
      int numberOfNews = 0;
      // List<Post> x = Provider.of<List<Post>>(context);
      //  print(x[0].emailUserPost);

      User _userOnline = provider.userOnline;

      int followPerson;
      if (_userOnline.followPerson == null) {
        followPerson = 0;
      } else {
        followPerson = _userOnline.followPerson.length;
      }
      int friends;
      if (_userOnline.friends == null) {
        friends = 0;
      } else {
        friends = _userOnline.friends.length;
      }
      var timeJoinApp;
      var createTimeFormat = DateFormat('dd-MM-yyyy');
      timeJoinApp = createTimeFormat.format(_userOnline.timeOnline.toDate());
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(
              "Trang cá nhân",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_userOnline.imageUser),
                    radius: 40,
                  ),
                ),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _userOnline.name,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${followPerson}  Người theo dõi',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ),
                        Container(
                          width: 15,
                        ),
                        Container(
                          child: Text(
                            '${friends}  Bạn bè',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, UPDATEPROFILE,
                                arguments: {
                                  'password': _userOnline.password,
                                  'uuid': _userOnline.uuid
                                });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    width: 1, color: Colors.grey[800])),
                            child: Text(
                              'Chỉnh sửa trang cá nhân',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.7, color: Colors.grey[600]),
                                borderRadius: BorderRadius.circular(60)),
                            child: Icon(
                              Icons.more_horiz,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
              ],
            ),
            Container(
              height: 12,
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[300],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 15, top: 10, bottom: 7, right: 10),
                  child: Icon(
                    Icons.star_border,
                    size: 26,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 7,
                  ),
                  child: Text(
                    'Coin App :',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 7, left: 15),
                  child: Text(
                    _userOnline.coinApp.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 15, top: 10, bottom: 7, right: 10),
                  child: Icon(
                    Icons.calendar_today,
                    size: 26,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 7,
                  ),
                  child: Text(
                    'Ngày tham gia :',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 7, left: 15),
                  child: Text(
                    timeJoinApp,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 15, top: 10, bottom: 7, right: 10),
                  child: Icon(
                    Icons.location_on,
                    size: 26,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 7,
                  ),
                  child: Text(
                    'Địa chỉ : ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 7, left: 15),
                  child: Text(
                    _userOnline.address,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 15, top: 10, bottom: 7, right: 10),
                  child: Icon(
                    Icons.insert_comment,
                    size: 26,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 7,
                  ),
                  child: Text(
                    'Phản hồi chat : ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 7, left: 15),
                  child: Text(
                    feedback,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),

                Row(
                  children: <Widget>[
                    Container(
                      padding:
                      EdgeInsets.only(left: 15, top: 10, bottom: 7, right: 10),
                      child: Icon(
                        Icons.phone,
                        size: 26,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 7,
                      ),
                      child: Text(
                        'Số điện thoại : ',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 7, left: 15),
                      child: Text(
                        _userOnline.phoneNumber,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding:
                      EdgeInsets.only(left: 15, top: 10, bottom: 7, right: 10),
                      child: Icon(
                        Icons.email,
                        size: 26,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 7,
                      ),
                      child: Text(
                        'Email : ',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 7, left: 15),
                      child: Text(
                        _userOnline.email,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),

                  ],
                ),

          ])));
    });
  }
}
