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
  User(this.uuid,this.email, this.password);
}