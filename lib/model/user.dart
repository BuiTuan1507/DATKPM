import 'package:flutter/material.dart';
class User{
  String uuid;
  String name;
  int sex;
  String address;
  String phoneNumber;
  String email;
  String password;
  DateTime timeOnline;
  int coinApp;
  User(this.uuid,this.email, this.password);
}