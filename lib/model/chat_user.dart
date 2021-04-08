import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUser{
  String idChatUser;
  String uuid;
  List<dynamic> chatRoom;

  ChatUser(this.idChatUser, this.uuid, this.chatRoom);
  ChatUser.fromJson(Map<dynamic, dynamic> data)
      : idChatUser = data['idChatUser'],
        uuid = data['uuid'],
        chatRoom = data['chatRoom'];

  ChatUser.fromSnapshot(DocumentSnapshot snapshot)
      : idChatUser = snapshot['idItem'],
        uuid = snapshot['uuid'],
        chatRoom = snapshot['chatRoom'];

  toJson() {
    return {
      "idChatUser": idChatUser,
      "uuid": uuid,
      'chatRoom': chatRoom,


    };
  }
}