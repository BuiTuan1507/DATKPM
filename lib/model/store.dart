import 'package:app_giao_do_an/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Store {
  String idStore; // id cua hang
  String uuid; // id chu cua hang
  String name; // ten cua hang
  String imageStore; // dia chi anh

  int rating; // danh gia trung binh
  int numberPersonRating; // số người đánh giá sản phẩm
  int subRating; // tong so sao danh gia
  List<dynamic> postId; // list cac bai dang

  String description; // mo ta ve cua hang
  Timestamp timeCreateStore; //  thoi gian tao cua hang
  int chatReturn; // % phan hoi chat

  Store(
      this.idStore,
      this.uuid,
      this.name,
      this.imageStore,
      this.rating,
      this.numberPersonRating,
      this.subRating,
      this.postId,
      this.description,

      this.chatReturn);

  Store.fromJson(Map<dynamic, dynamic> data)
      : idStore = data['idStore'],
        uuid = data['uuid'],
        name = data['name'],
        imageStore = data['imageStore'],
        rating = data['rating'],
        numberPersonRating = data['numberPersonRating'],
        subRating = data['subRating'],
        postId = data['postId'],
        description = data['description'],

        chatReturn = data['timeCreateStore'];

  Store.fromSnapshot(DocumentSnapshot snapshot)
      : idStore = snapshot['idStore'],
        uuid = snapshot['uuid'],
        name = snapshot['name'],
        imageStore = snapshot['imageStore'],
        rating = snapshot['rating'],
        numberPersonRating = snapshot['numberPersonRating'],
        subRating = snapshot['subRating'],
        postId = snapshot['postId'],
        description = snapshot['description'],

        chatReturn = snapshot['chatReturn'];

  toJson() {
    return {
      "idStore": idStore,
      'uuid': uuid,
      "name": name,
      'imageStore': imageStore,
      "rating": rating,
      "numberPersonRating": numberPersonRating,
      "subRating": subRating,
      "postId": postId,
      "description": description,

      'chatReturn': chatReturn
    };
  }
}
