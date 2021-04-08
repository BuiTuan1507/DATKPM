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

  ChatRoom({this.lastMessage,
      this.lastTimeRead,this.buyUuid});
  // ChatRoom(this.idChatRoom, this.isReading, this.lastMessage, this.lastTimeRead,
  //    this.buyUuid, this.sellUuid, this.chatMesaage);


}