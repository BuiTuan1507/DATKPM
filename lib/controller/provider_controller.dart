import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  User userOnline;
  Firestore firestore = Firestore.instance;

  void addPost(String tittleP, String addressP, String description,
      int price, String selectType, String selectCategory, String statusProduct,
      String nameUser, String phoneNumber, String emailUser, String address) {
    firestore.collection('Post').document().setData({
      'tittle': tittleP,
      'address': addressP,
      'description': description,
      'price': price,
      'selectType': selectType,
      'statusProduct': statusProduct,
      'selectCategory': selectCategory,

    });
  }

  Future<void> getUserOnline(String uuid) async {
    DocumentSnapshot snapshot = await firestore.collection('User').document(
        uuid).get();
    userOnline = User.fromSnapshot(snapshot);
  }

  void updateUserInfo(String nameChange,
      String passwordChange,
      String addressChange,
      String phoneNumberChange,
      int sexChange){
    firestore.collection('User').document(userOnline.uuid).updateData({
      'address':addressChange,
      'name':nameChange,
      'password':passwordChange,
      'phoneNumber':phoneNumberChange,
      'sex':sexChange
    });
    print('Update info user');
  }

}