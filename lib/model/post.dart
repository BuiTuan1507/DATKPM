import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class Post {
  String idPost; // id Bai dang
  String uuid; // id nguoi dang
  String nameUserPost;
  String emailUserPost;
  String phoneNumberPost;
  String addressPost; // noi giao dich
  Timestamp timeCreate; // thoi gian dang
  Item item; // san pham
  List<dynamic> report; // danh sách người báo cáo bài viết
  int isPriority;

  Post(this.idPost,
      this.uuid,
      this.nameUserPost,
      this.emailUserPost,
      this.phoneNumberPost,

      this.addressPost,
      this.timeCreate,
      this.item,
      this.report,
      this.isPriority);

  // độ ưu tiên
  Post.fromJson(Map<String, dynamic> data)
      : idPost = data['idPost'],
        uuid = data['uuid'],
        nameUserPost = data['nameUserPost'],
        emailUserPost = data['emailUserPost'],
        phoneNumberPost = data['phoneNumberPost'],

        addressPost = data['addressPost'],
        timeCreate = data['timeCreate'],
        item = Item.fromJson(data['item'][0]),
        report = data['report'],
        isPriority = data['isPriority'];

  Post.fromSnapshot(DocumentSnapshot snapshot)
      : idPost = snapshot['idPost'],
        uuid = snapshot['uuid'],
        nameUserPost = snapshot['nameUserPost'],
        emailUserPost = snapshot['emailUserPost'],
        phoneNumberPost = snapshot['phoneNumberPost'],

        addressPost = snapshot['addressPost'],
        timeCreate = snapshot['timeCreate'],
        item = Item.fromSnapshot(snapshot['item'][0]),
        report = snapshot['report'],
        isPriority = snapshot['isPriority'];

  toJson() {
    return {
      "idPost": idPost,
      "uuid": uuid,
      'emailUserPost': emailUserPost,
      "nameUserPost": nameUserPost,
      "phoneNumberPost": phoneNumberPost,
      "addressPost": addressPost,
      "timeCreate": timeCreate,
      "item": item,
      "report": report,
      "isPriority": isPriority,

    };
  }
}