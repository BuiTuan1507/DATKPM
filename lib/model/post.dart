import 'package:flutter/material.dart';

import 'item.dart';
class Post{
  String idPost;
  String uuid;
  DateTime timeCreate;
  Item item;
  List<String> report; // danh sách người báo cáo bài viết
  bool isPriority; // độ ưu tiên
  Post(this.idPost, this.item, this.uuid);
}