import 'package:flutter/material.dart';
class Item{
  String id;
  String name;
  String image;
  int cost;
  DateTime time;
  String address;
  String type ;
  String category;
  String status;
  String description ;
  bool isStore;
  Item(this.id, this.name, this.image, this.cost, this.address, this.isStore);
}