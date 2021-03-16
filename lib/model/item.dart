import 'package:flutter/material.dart';
class Item{
  String idItem;
  String name;
  List<String> image;
  int cost;
  String type ; // Loại gì?
  String category; // thuộc nhómn nào trong loại đó ?
  String status; // trạng thái của loại sản phẩm
  String description ;
  bool isStore;
  Item(this.idItem, this.name, this.image, this.cost, this.type, this.category,
      this.status, this.description, this.isStore); // mô tả

}