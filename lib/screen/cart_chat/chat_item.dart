import 'package:app_giao_do_an/model/chat_message.dart';
import 'package:app_giao_do_an/model/chat_room.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class ChatItem extends StatefulWidget {
  ChatRoom chatRoom;
  User chatUser;
  String uuid;

  ChatItem({Key key, this.chatRoom, this.chatUser, this.uuid})
      : super(key: key);

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {


  String text = "";
  var timeNow = DateTime.now();
  TextEditingController helpController = new TextEditingController();
  ChatRoom _chatRoom ;
  void printLengthChatRoom(ChatRoom chatRoom){
    print(chatRoom.buyUuid);
    if(chatRoom != null) {
      print(chatRoom.chatMessage);
    }
  }
  void sendMessage(String text, String sendUuid, String takeUuid,
      String idChatMessage, ChatRoom chatRoom) {
    Timestamp timestamp = Timestamp.fromDate(DateTime.now());

    Firestore firestore = Firestore.instance;
    var chatMessage = [];
    if (chatRoom.chatMessage != null) {
      chatMessage = chatRoom.chatMessage;
    }

    int lengthOfRoom;
    if (chatRoom.chatMessage != null) {
      lengthOfRoom = chatRoom.chatMessage.length + 1;
    } else {
      lengthOfRoom = 0;
    }
    chatMessage.add({
      'idChatMessage': idChatMessage,
      'sendUuid': sendUuid,
      'takeUuid': takeUuid,
      'message': text,
      'createMessage': timestamp,
      'lengthOfRoom': lengthOfRoom
    });
    firestore.collection('ChatRoom').document(chatRoom.idChatRoom).updateData({
      'chatMesaage': FieldValue.arrayUnion(chatMessage)
    });
    print(chatMessage);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    String currentUser = widget.uuid;
    String pairId = widget.chatUser.uuid;

    List<ChatRoom> x = Provider.of<List<ChatRoom>>(context);

    if(x != null){
      for (int  i = 0; i< x.length ; i++)
      {
        if(x[i].idChatRoom == widget.chatRoom.idChatRoom){
          _chatRoom = x[i];
          break;
        }
      }
    }



    return
      Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.amber,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
            title: Text(
              "${widget.chatUser.name}",
              style: TextStyle(fontSize: 19, color: Colors.black),),
            centerTitle: true,
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('ChatRoom').where('idChatRoom',isEqualTo: widget.chatRoom.idChatRoom).snapshots(),
            builder: (context, snapshot) {
              var chatRoomItem = snapshot.data.documents;
                return (!snapshot.hasData) ? GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          reverse: true,
                          itemBuilder: (context, index) {

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Row(
                                mainAxisAlignment: chatRoomItem[index]['sendUuid'] ==
                                    currentUser
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: <Widget>[
                                  _isFirstMessage(chatRoomItem, index) &&
                                      chatRoomItem[index]['sendUuid'] == pairId
                                      ? Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: ExactAssetImage(
                                          "assets/h1.jpg",
                                        ),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                    ),
                                  )
                                      : Container(
                                    width: 30,
                                    height: 30,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery
                                          .of(context)
                                          .size
                                          .width * .7,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 12,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(
                                          _isFirstMessage(chatRoomItem, index)
                                              ? 0
                                              : 10,
                                        ),
                                        bottomLeft: Radius.circular(
                                          _isLastMessage(chatRoomItem, index)
                                              ? 0
                                              : 10,
                                        ),
                                      ),
                                      color: chatRoomItem[index]['sendUuid'] ==
                                          currentUser
                                          ? AppColors.blueColor
                                          : Colors.grey[400],
                                    ),
                                    child: Text(
                                      "${chatRoomItem[index]['message']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),

                ) : Container(
                  height: queryData.size.height,
                  width: queryData.size.height,
                  color: Colors.white,
                );

              },

          ),
          bottomNavigationBar: _buildInput(),
    );

  }

  Widget _buildInput() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: AppColors.blueColor,
            ),
            onPressed: null,
          ),
          Expanded(
            child: TextField(
              controller: helpController,
              onChanged: (value) {
                text = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Nhập tin nhắn",

                hintStyle: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),

          IconButton(
            icon: Icon(
              Icons.send,
              color: AppColors.blueColor,
            ),
            onPressed: () {
              String idChatMessage = randomAlpha(20);
              helpController.clear();
                printLengthChatRoom(_chatRoom);
              //sendMessage(text, widget.uuid, widget.chatUser.uuid, idChatMessage, _chatRoom,);
            },
          ),
        ],
      ),
    );
  }

  _isFirstMessage(List<DocumentSnapshot> chatItems, int index) {
    return (chatItems[index]['sendUuid'] !=
        chatItems[index - 1 < 0 ? 0 : index - 1]['sendUuid']) ||
        index == 0;
  }

  _isLastMessage(List<DocumentSnapshot> chatItems, int index) {
    int maxItem = chatItems.length - 1;
    return (chatItems[index]['sendUuid'] !=
        chatItems[index + 1 > maxItem ? maxItem : index + 1]['sendUuid']) ||
        index == maxItem;
  }
}

class AppColors {
  static Color mainColor = Color(0XFF252331);
  static Color darkColor = Color(0XFF1e1c26);
  static Color blueColor = Color(0XFF2c75fd);
}