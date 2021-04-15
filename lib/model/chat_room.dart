import 'package:app_giao_do_an/model/chat_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ChatRoom{
  String idChatRoom; //id phong chat
  bool isReading ; //  da doc tin nhan cuoi hay chua

  String nameProduct; // tin nhan cuoi cung
  Timestamp lastTimeRead; //  thoi gian doc tin cuoi cung

  String buyUuid; //  nguoi dung app
  String sellUuid; //  nguoi dinh nhan tin

  List<dynamic> chatMessage;


   ChatRoom(this.idChatRoom, this.isReading, this.nameProduct, this.lastTimeRead,
      this.buyUuid, this.sellUuid, this.chatMessage);
  ChatRoom.fromJson(Map<dynamic, dynamic> data)
      : idChatRoom = data['idChatRoom'],
        isReading = data['isReading'],
        nameProduct = data['nameProduct'],

        lastTimeRead = data['lastTimeRead'],
        buyUuid = data['buyUuid'],

        sellUuid = data['sellUuid'],
        chatMessage = (data['chatMessage'] != null) ? data['chatMessage'] : null;
  // chatMessage =(data['chatMessage'] != null) ? data.entries.map((e) => print(e.value)).toList() : null;

  ChatRoom.fromSnapshot(DocumentSnapshot snapshot)
      : idChatRoom = snapshot['idChatRoom'],
        isReading = snapshot['isReading'],
        nameProduct = snapshot['nameProduct'],
        lastTimeRead = snapshot['lastTimeRead'],
        buyUuid = snapshot['buyUuid'],

        sellUuid = snapshot['sellUuid'],
        chatMessage =(snapshot['chatMessage']);

  toJson() {
    return {
      "idChatRoom": idChatRoom,
      "isReading": isReading,
      'nameProduct': nameProduct,
      "lastTimeRead": lastTimeRead,
      "buyUuid": buyUuid,
      "sellUuid": sellUuid,
      "chatMessage": chatMessage,


    };
  }

}