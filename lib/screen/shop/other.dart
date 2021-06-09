import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OtherApp extends StatefulWidget {
  List<Post> other;
  OtherApp({Key key, this.other}) : super(key: key);
  @override
  _OtherAppState createState() => _OtherAppState();
}

class _OtherAppState extends State<OtherApp> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ProviderController>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
                child: (widget.other != null)
                    ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 40,
                      ),
                      Center(
                        child:
                        Text('Bạn đang rao bán ${widget.other.length}',style: TextStyle(fontSize: 19),),
                      ),
                      Container(
                        height: 20,
                      ),
                      ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: widget.other.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 0.7, color: Colors.grey[500])),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  widget.other[index].item
                                                      .image[0],
                                                ),
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          alignment: Alignment.topRight,
                                        )),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      margin: EdgeInsets.only(bottom: 30),
                                      child: Text(
                                        widget.other[index].item.image.length
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 15,
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Text(
                                              widget.other[index].item.name,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black45),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 15, bottom: 10),
                                            child: Text(
                                              widget.other[index].item.cost
                                                  .toString() +
                                                  ' đ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                  fontSize: 19),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[

                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 15, right: 10),
                                                child: Text(
                                                  widget.other[index]
                                                      .addressPost,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap:(){

                                                },
                                                child: Container(
                                                  child: Icon(Icons.delete, size: 24,),
                                                ),
                                              )

                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                )
                    : Column(
                  children: <Widget>[
                    Container(
                      height: 150,
                    ),
                    Center(
                      child: Text('Bạn không có tin nào trong mục này'),
                    )
                  ],
                ));
          },
        ));
  }
}

