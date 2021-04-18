import 'package:app_giao_do_an/model/chat_room.dart';
import 'package:app_giao_do_an/model/store.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BuyChat extends StatefulWidget {
  String uuid;
  BuyChat({Key key, this.uuid}) : super(key: key);
  @override
  _BuyChatState createState() => _BuyChatState();
}

class _BuyChatState extends State<BuyChat> {

  @override
  Widget build(BuildContext context) {
    List<ChatRoom> _chat = Provider.of<List<ChatRoom>>(context);
    List<ChatRoom> _chatRoom = [];
    List<Store> _store = Provider.of<List<Store>>(context);


    List<User> _userList = Provider.of<List<User>>(context);
    // tim chat room
    if (_chat != null){
      for (int  i = 0 ; i< _chat.length ; i++){
        if (widget.uuid == _chat[i].buyUuid) {
          _chatRoom.add(_chat[i]);
        }
      }
    }
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: (_chatRoom != null) ? SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _chatRoom.length,
              itemBuilder: (context,index){
                Store store;
                for (int  i = 0 ; i < _store.length ; i++){
                  if (_store[i].uuid == _chatRoom[index].sellUuid ){
                    store = _store[i];
                    break;
                  }
                }
                User _chatUser ;
                for (int  i = 0; i< _userList.length ; i++){
                  if(_chatRoom[index].sellUuid == _userList[i].uuid){
                    _chatUser = _userList[i];
                    break;
                  }
                }
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CHATITEM,arguments: {'ChatRoom':_chatRoom[index],'uuid':widget.uuid,'chatUser':_chatUser});
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(store.imageStore),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Container(
                            width: 65,
                            height: 65,
                            padding: EdgeInsets.all(2),

                            alignment: Alignment.topRight,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width:1.5,color: Colors.white)
                              ),
                              child: Image.asset('assets/online.jpg',),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: queryData.size.width*0.45,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(store.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,),
                                ),
                                Container(
                                  child: Text('5 ' + 'ngay', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),),
                                )
                              ],
                            ),
                            Container(
                              width: queryData.size.width*0.5,

                              padding: EdgeInsets.only(top: 12),
                              child: Text(_chatRoom[index].nameProduct, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color:Colors.grey),overflow: TextOverflow.ellipsis,),
                            )
                          ],
                        ),


                      ],
                    ),
                  ),
                )
                ;
              },
            )
          ],
        ),
      ) : Column(
        children: <Widget>[
          Container(
            height: 100,
          ),
          Center(
            child: Text('Bạn không có tin nhắn'),
          )
        ],
      ),
    );
  }
}
