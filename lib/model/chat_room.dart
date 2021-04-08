import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ChatRoom{
  String idChatRoom; //id phong chat
  bool isReading ; //  da doc tin nhan cuoi hay chua

  String lastMessage; // tin nhan cuoi cung
  Timestamp lastTimeRead; //  thoi gian doc tin cuoi cung

  String buyUuid; //  nguoi 1
  String sellUuid; //  nguoi 2

  List<dynamic> chatMessage;


   ChatRoom(this.idChatRoom, this.isReading, this.lastMessage, this.lastTimeRead,
      this.buyUuid, this.sellUuid, this.chatMessage);
  ChatRoom.fromJson(Map<dynamic, dynamic> data)
      : idChatRoom = data['idChatRoom'],
        isReading = data['isReading'],
        lastMessage = data['lastMessage'],

        lastTimeRead = data['lastTimeRead'],
        buyUuid = data['buyUuid'],

        sellUuid = data['sellUuid'],
        chatMessage = data['chatMessage'];

  ChatRoom.fromSnapshot(DocumentSnapshot snapshot)
      : idChatRoom = snapshot['idChatRoom'],
        isReading = snapshot['isReading'],
        lastMessage = snapshot['lastMessage'],
        lastTimeRead = snapshot['lastTimeRead'],
        buyUuid = snapshot['buyUuid'],

        sellUuid = snapshot['sellUuid'],
        chatMessage = snapshot['chatMessage'];

  toJson() {
    return {
      "idChatRoom": idChatRoom,
      "isReading": isReading,
      'lastMessage': lastMessage,
      "lastTimeRead": lastTimeRead,
      "buyUuid": buyUuid,
      "sellUuid": sellUuid,
      "chatMessage": chatMessage,


    };
  }

}