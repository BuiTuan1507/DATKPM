import 'dart:async';

import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/store.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{
  final productStreamController = StreamController.broadcast();
  Stream get getStream => productStreamController.stream;
  Stream <List<Post>> getPost() {
    Stream<List<Post>> uPost = Firestore.instance.collection('Post').snapshots().map((event) => event.documents.map((e) => Post.fromJson(e.data)).toList() );

    return uPost;
  }

  Stream <List<Store>> getStore() {
    Stream<List<Store>> uStore = Firestore.instance.collection('Store').snapshots().map((event) => event.documents.map((e) => Store.fromJson(e.data)).toList() );

    return uStore;
  }

  void dispose() {
    productStreamController.close(); // close our StreamController
  }
}