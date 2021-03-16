import 'dart:async';

import 'package:app_giao_do_an/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{
  final productStreamController = StreamController.broadcast();
  Stream get getStream => productStreamController.stream;


  void dispose() {
    productStreamController.close(); // close our StreamController
  }
}