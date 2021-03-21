import 'package:flutter/material.dart';

import 'item.dart';
class Post{
  String idPost; // id Bai dang
  String uuid; // id nguoi dang
  String nameUserPost;
  String emailUserPost;
  String phoneNumberPost;
  String addressPost; // noi giao dich
  DateTime timeCreate; // thoi gian dang
  Item item; // san pham
  List<String> report; // danh sách người báo cáo bài viết
  int isPriority;

  Post(
      this.idPost,
      this.uuid,
      this.nameUserPost,
      this.emailUserPost,
      this.phoneNumberPost,
      this.addressPost,
      this.timeCreate,
      this.item,
      this.report,
      this.isPriority); // độ ưu tiên

}