import 'package:flutter/material.dart';
class User{
  String uuid;
  String name;
  int sex; // 0 là chưa có, 1 là nam, 2 là nữ, 3 là k muốn tiết lộ
  String address;
  String phoneNumber;
  String email;
  String password;
  bool isOnline;
  DateTime timeOnline;
  int coinApp;
  List<String> friends;
  List<String> followPerson;
  User(this.uuid,this.email, this.password);
}