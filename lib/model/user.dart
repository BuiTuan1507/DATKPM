import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  String uuid;
  String name;
  int sex; // 0 là chưa có, 1 là nam, 2 là nữ, 3 là k muốn tiết lộ
  String imageUser;

  String address;
  String phoneNumber;
  String email;
  String password;

  bool isOnline;
  Timestamp timeOnline;
  Timestamp timeUseApp;
  int coinApp;
  List<dynamic> friends;

  List<dynamic> followPerson;

  User(this.uuid, this.email, this.password);

  User.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        uuid = data['uuid'],
        email = data['email'],
        sex = data['sex'],
        imageUser = data['imageUser'],
        address = data['address'],
        phoneNumber = data['phoneNumber'],
        password = data['password'],
        isOnline = data['isOnline'],
        coinApp = data['coinApp'],
        timeOnline = data['timeOnline'],
        timeUseApp = data['timeUseApp'],
        friends = data['friends'],
        followPerson = data['followPerson'];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot['name'],
        uuid = snapshot['uuid'],
        email = snapshot['email'],
        sex = snapshot['sex'],
        imageUser = snapshot['imageUser'],
        address = snapshot['address'],
        phoneNumber = snapshot['phoneNumber'],
        password = snapshot['password'],
        isOnline = snapshot['isOnline'],
        coinApp = snapshot['coinApp'],
        timeOnline = snapshot['timeOnline'],
        timeUseApp = snapshot['timeUseApp'],
        friends = snapshot['friends'],
        followPerson = snapshot['followPerson'];

  toJson() {
    return {
      "name": name,
    "uuid" : uuid,
    'email': email,
    "sex" :sex ,
    "imageUser" : imageUser ,
    "address" : address,
    "phoneNumber" :phoneNumber ,
    "password" : password,
    "isOnline" : isOnline ,
    "coinApp" : coinApp ,
    "timeOnline" : coinApp ,
      "timeUseApp":timeUseApp,
    "friends" : friends ,
    "followPerson" : followPerson
    };
  }
}
