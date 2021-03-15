import 'package:app_giao_do_an/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier{
  Firestore firestore = Firestore.instance;
  void addPost(String tittleP,String addressP,String description,
      int price,String selectType,String selectCategory,String statusProduct,
      String nameUser,String phoneNumber,String emailUser,String address
      ){
    firestore.collection('Post').document().setData({
      'tittle':tittleP,
      'address':addressP,
      'description':description,
      'price':price,
      'selectType':selectType,
      'statusProduct':statusProduct,
      'selectCategory':selectCategory,

    });
  }
}