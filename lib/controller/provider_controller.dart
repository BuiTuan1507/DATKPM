import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  User userOnline;
  Firestore firestore = Firestore.instance;

  void addPost(Post post) {
    List <dynamic> imageProduct = List<dynamic>();
    firestore.collection('Post').document(post.idPost).setData({
      'idPost':post.idPost,
      'uuid':post.uuid,
      'nameUserPost':post.nameUserPost,
      'emailUserPost':post.emailUserPost,
      'phoneNumberPost':post.phoneNumberPost,
      'addressPost':post.addressPost,
      'timeCreate':post.timeCreate,
      'item':post.item,
      'report':post.report,
      'isPriority':post.isPriority

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