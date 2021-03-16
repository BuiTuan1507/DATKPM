import 'package:app_giao_do_an/model/post.dart';
import 'package:flutter/material.dart';
class Store{
  String idStore;
  String uuid;
  String name;
  double rating;
  int numberPersonRating; // số người đánh giá sản phẩm
  List<Post> post;
  String description;
  Store(this.idStore, this.uuid);
}