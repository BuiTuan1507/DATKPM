import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Item{
  String idItem;
  String name; // tiêu đề sản phẩm
  List<dynamic> image; // danh sách ảnh sản phẩm ( 3)
  int cost; // giá
  String type ; // Loại gì?
  String category; // thuộc nhómn nào trong loại đó ?
  String status; // trạng thái của loại sản phẩm
  String description ; // mô tả
  bool isStore;

  Item(this.idItem, this.name, this.image, this.cost, this.type, this.category,
      this.status, this.description, this.isStore);

  Item.fromJson(Map<dynamic, dynamic> data)
      : idItem = data['idItem'],
        name = data['name'],
        image = data['image'],
        cost = data['cost'],
        type = data['type'],

        category = data['category'],
        status = data['status'],
        description = data['description'],
        isStore = data['isStore'];

  Item.fromSnapshot(DocumentSnapshot snapshot)
      : idItem = snapshot['idItem'],
        name = snapshot['name'],
        image = snapshot['image'],
        cost = snapshot['cost'],
        type = snapshot['type'],

        category = snapshot['category'],
        status = snapshot['status'],
        description = snapshot['description'],
        isStore = snapshot['isStore'];

  toJson() {
    return {
      "idItem": idItem,
      "name": name,
      'image': image,
      "cost": cost,
      "type": type,
      "category": category,
      "status": status,
      "description": description,
      "isStore": isStore,

    };
  }
}