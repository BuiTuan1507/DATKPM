import 'package:flutter/material.dart';
class Item{
  String idItem;
  String name; // tiêu đề sản phẩm
  List<String> image; // danh sách ảnh sản phẩm ( 3)
  int cost; // giá
  String type ; // Loại gì?
  String category; // thuộc nhómn nào trong loại đó ?
  String status; // trạng thái của loại sản phẩm
  String description ; // mô tả
  bool isStore;

  Item(this.idItem, this.name, this.image, this.cost, this.type, this.category,
      this.status, this.description, this.isStore);
}