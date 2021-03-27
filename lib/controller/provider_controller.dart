import 'package:app_giao_do_an/model/item.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {

  User userOnline;
  Firestore firestore = Firestore.instance;
  List<Post> userPost;
  List<Post> cartPost;


  //Post
  void addPost(Post post) {
    List <dynamic> imageProduct = List<dynamic>();
    String idItem = post.item.idItem;
    String name = post.item.name;
    List<dynamic> image;
    int cost = post.item.cost;
    String type = post.item.type;
    String category = post.item.category;
    String status = post.item.status;
    String description =  post.item.description;
    bool isStore = post.item.isStore;
    List item = [];
    item.add({
      'idItem': idItem,
      'name':name,
      'image':image,
      'cost':cost,
      'type':type,
      'category':category,
      'status':status,
      'description':description,
      'isStore':isStore
    });
    firestore.collection('Post').document(post.idPost).setData({
      'idPost':post.idPost,
      'uuid':post.uuid,
      'nameUserPost':post.nameUserPost,
      'emailUserPost':post.emailUserPost,
      'phoneNumberPost':post.phoneNumberPost,

      'addressPost':post.addressPost,
      'timeCreate':post.timeCreate,
      'item':item,
      'report':post.report,
      'isPriority':post.isPriority

    });
    print('Add Post');
  }
  Future<void> getAllPost(String uuid) async{

    Firestore.instance.collection('Post').where('uuid',isEqualTo: uuid).snapshots().listen((event) {
      for (int i = 0 ; i< event.documents.length; i++){
       String post = Post.fromSnapshot(event.documents[i]).item.name;
       print(post);
       //userPost.add(post);
      }
    });

    print('Get All Post');
  }

  Stream <List<Post>> getPostUser(String uuid) {
    Stream<List<Post>> uPost = firestore.collection('Post').where('uuid',isEqualTo: uuid).snapshots().map((event) => event.documents.map((e) => Post.fromJson(e.data)).toList() );

    return uPost;
  }
  //User
  Future<void> getUserOnline(String uuid) async {
    DocumentSnapshot snapshot = await firestore.collection('User').document(
        uuid).get();
    userOnline = User.fromSnapshot(snapshot);
    print("Get User Online");
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

  //Cart
  void addCart(Post post){
    cartPost.add(post);
    notifyListeners();
  }
  void removeCart(Post post){
    cartPost.remove(post);
    notifyListeners();
  }
}