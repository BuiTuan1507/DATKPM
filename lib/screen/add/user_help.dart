import 'package:flutter/material.dart';
class UserHelp extends StatefulWidget {
  String imageUser;

  UserHelp({Key key, this.imageUser})
      : super(key: key);
  @override
  _UserHelpState createState() => _UserHelpState();
}

class _UserHelpState extends State<UserHelp> {
  static const defaultImageString =
      "https://firebasestorage.googleapis.com/v0/b/appdoan-53f1b.appspot.com/o/postProductsach.jpg?alt=media&token=c1e791af-dae8-440b-a9af-816e536f98b1";
  ChatModel currentChat = ChatModel.list.elementAt(0);
  String currentUser = "1";
  String pairId = "2";

  List<ChatItemModel>  chatItems = [




    ChatItemModel(
      "1",
      "Mình không biết làm.",
    ),
    ChatItemModel(
      "1",
      "Làm thế nào để đăng bài nhỉ?",
    ),
    ChatItemModel(
      "1",
      "Bạn giúp mình với",
    ),
    ChatItemModel(
      "2",
      "Tôi có thể giúp gì cho bạn?",
    ),
    ChatItemModel(
      "2",
      "Xin chào !",
    ),
    ChatItemModel(
      "1",
      "Admin ơi!",
    ),



  ];
  void addMessage(ChatItemModel chat, List<ChatItemModel> list1){
    int i;
    if(list1 != null){
      i = list1.length - 1;

    }else {
      i = 0;
    }
    list1.insert(0, chat);
  }

  TextEditingController helpController = new TextEditingController();
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          "${currentChat.contact.name}",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: chatItems.length,
              reverse: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: chatItems[index].senderId == currentUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: <Widget>[
                      _isFirstMessage(chatItems, index) &&
                          chatItems[index].senderId == pairId
                          ? Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: (widget.imageUser != null ) ? NetworkImage(widget.imageUser) : NetworkImage(defaultImageString)
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
                          maxWidth: MediaQuery.of(context).size.width * .7,
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
                              _isFirstMessage(chatItems, index) ? 0 : 10,
                            ),
                            bottomLeft: Radius.circular(
                              _isLastMessage(chatItems, index) ? 0 : 10,
                            ),
                          ),
                          color: chatItems[index].senderId == currentUser
                              ? Colors.blue
                              : Colors.grey[400],
                        ),
                        child: Text(
                          "${chatItems[index].message}",
                          style: TextStyle(
                            color: Colors.white,
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
          if (currentChat.isTyping)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(
                    "${currentChat.contact.name} is typing...",
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  )
                ],
              ),
            ),
        ],
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
              color: Colors.blue,
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
              color: Colors.blue,
            ),
            onPressed: () {
              print(helpController.text);
              if(text != null){
                ChatItemModel c = new ChatItemModel('1',helpController.text);
                setState(() {
                  addMessage(c,chatItems);
                });
                helpController.clear();

              }

            },
          ),
        ],
      ),
    );
  }

  _isFirstMessage(List<ChatItemModel> chatItems, int index) {
    return (chatItems[index].senderId !=
        chatItems[index - 1 < 0 ? 0 : index - 1].senderId) ||
        index == 0;
  }

  _isLastMessage(List<ChatItemModel> chatItems, int index) {
    int maxItem = chatItems.length - 1;
    return (chatItems[index].senderId !=
        chatItems[index + 1 > maxItem ? maxItem : index + 1].senderId) ||
        index == maxItem;
  }
}

class ChatItemModel {
   String senderId;
   String message;



   ChatItemModel(this.senderId, this.message);


}



class ChatModel {
  final bool isTyping;
  final String lastMessage;
  final String lastMessageTime;
  final ContactModel contact;

  ChatModel(
      {this.isTyping, this.lastMessage, this.lastMessageTime, this.contact});


  static List<ChatModel> list = [
    ChatModel(
      isTyping: true,
      lastMessage: "hello!",
      lastMessageTime: "2d",
      contact: ContactModel(name: "Admin"),
    ),

  ];
}

class ContactModel {
  final String name;

  ContactModel({this.name});
}