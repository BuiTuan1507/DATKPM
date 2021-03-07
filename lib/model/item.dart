import 'package:flutter/material.dart';
class Item{
  String id;
  String name;
  String image;
  int cost;
  DateTime time;
  String address;
  bool isStore;
  Item(this.id, this.name, this.image, this.cost, this.address, this.isStore);
}