import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnSale extends StatefulWidget {
  @override
  _OnSaleState createState() => _OnSaleState();
}

class _OnSaleState extends State<OnSale> {
  Firestore _firestore = Firestore.instance;
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<ProviderController>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('Post')
              .where('uuid', isEqualTo: provider.userOnline.uuid)
              .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.hasData != null)
                ? SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 40,
                        ),
                        Center(
                          child: Text(
                              'Bạn đang rao bán ${snapshot.data.documents.length}'),
                        ),
                        Container(
                          height: 20,
                        ),
                        ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 0.7, color: Colors.grey[500])
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    snapshot.data.documents[index]['item'][0]['image'][0],),
                                                  fit: BoxFit.cover)),
                                          child: Container(
                                            width: 70,
                                            height: 70,

                                            alignment: Alignment.topRight,

                                          )),
                                      Container(
                                        width: 20,
                                        height: 20,

                                        margin: EdgeInsets.only(bottom:30),
                                        child: Text(snapshot.data.documents[index]['item'][0]['image'].length.toString(),style: TextStyle(fontSize: 18, color:Colors.redAccent, fontWeight: FontWeight.bold),),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              padding:EdgeInsets.only(left: 15,top: 10, bottom: 10,),
                                              child: Text(snapshot.data.documents[index]['item'][0]['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left:15, bottom: 10),
                                              child: Text(snapshot.data.documents[index]['item'][0]['cost'].toString() + ' tỷ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 19),),
                                            ),

                                            Row(
                                              children: <Widget>[
                                                Container(
                                                    padding:EdgeInsets.only(left: 15),
                                                    child: (snapshot.data.documents[index]['isPriority'] == 0) ? (Icon(Icons.store, size: 25,)) : (Icon(Icons.person_pin))),
                                                Container(
                                                  padding: EdgeInsets.only(left: 15,right: 70),
                                                  child: Text(snapshot.data.documents[index]['addressPost'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                                ),


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
                        child: Text('Bạn đang không bán gì'),
                      )
                    ],
                  );
          },
        ));
      },
    ));
  }
}
