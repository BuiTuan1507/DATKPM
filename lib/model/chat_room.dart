import 'package:flutter/material.dart';
class ChatRoom{
  String idChatRoom; //id phong chat
  bool isReading ; //  da doc tin nhan cuoi hay chua
  String lastMessage; // tin nhan cuoi cung
  String lastTimeRead; //  thoi gian doc tin cuoi cung
  String buyUuid; //  nguoi 1
  String sellUuid; //  nguoi 2
  List<dynamic> chatMesaage;

  ChatRoom({this.lastMessage,
      this.lastTimeRead,this.buyUuid});
  // ChatRoom(this.idChatRoom, this.isReading, this.lastMessage, this.lastTimeRead,
  //    this.buyUuid, this.sellUuid, this.chatMesaage);

  static List<ChatRoom> list = [
    ChatRoom(
      lastMessage: "hello!",
      lastTimeRead: "2d",
      buyUuid: "Minh Tuan",
    ),
    ChatRoom(
      lastMessage: "Sure, no problem Jhon!",
      lastTimeRead: "2d",
      buyUuid: "Maria Illescas",
    ),
    ChatRoom(
      lastMessage: "thank you Jhon!",
      lastTimeRead: "2d",
      buyUuid: "Kate Stranger",
    ),
  ];
}