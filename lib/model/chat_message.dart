import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ChatMessage{
  String idChatMessage; //  id tin nhan
  String sendUuid; // uuid nguoi gui
  String takeUuid; //  uuid nguoi nhan
  String message; // tin nhan
  Timestamp createMessage; //  thoi gian nhan tin

  ChatMessage(this.idChatMessage,this.sendUuid,this.takeUuid, this.message, this.createMessage);

 // ChatMessage({this.sendUuid, this.message});
  ChatMessage.fromJson(Map<dynamic, dynamic> data)
      : idChatMessage = data['idChatMessage'],
        sendUuid = data['sendUuid'],
        takeUuid = data['takeUuid'],

        message = data['message'],
        createMessage = data['createMessage'];

  ChatMessage.fromSnapshot(DocumentSnapshot snapshot)
      : idChatMessage = snapshot['idChatMessage'],
        sendUuid = snapshot['sendUuid'],
        takeUuid = snapshot['takeUuid'],
        message = snapshot['message'],
        createMessage = snapshot['createMessage'];

  toJson() {
    return {
      "idChatMessage": idChatMessage,
      "sendUuid": sendUuid,
      'takeUuid': takeUuid,
      "message": message,
      "createMessage": createMessage,

    };
  }


}