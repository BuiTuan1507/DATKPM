import 'package:app_giao_do_an/model/chat_user.dart';
import 'package:app_giao_do_an/model/item.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/store.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class ProviderController extends ChangeNotifier {

  User userOnline;
  Store userStore;
  ChatUser chatUser;
  Firestore firestore = Firestore.instance;
  Stream<List<Post>> userPost;
  List<Post> cartPost = [];
  List<Post> favoritePost = [];


  //Post
  void addPost(Post post,Store store,String idStore) {
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
    var x = new List<dynamic>();
    if(store != null){
      x = store.postId;
    }else{
      x = [];
    }

    x.add(post.idPost);
    firestore.collection('Store').document(idStore).updateData({
      'postId':x.toList()
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
  // Delete Post

  //Store User
  Future<void> getStoreUser(String uuid) async {

    await firestore.collection('Store').where('uuid', isEqualTo: uuid).getDocuments().then((value) => {
      userStore =((value.documents.isEmpty == false)) ? Store.fromSnapshot(value.documents[0])  : null
    }
    );

    print("Get Store");

  }
  //Create Store
  String createStore(String uuid) {
    print('xyyuy');
    List<dynamic> postId = List<dynamic>();
    String idStore = randomAlpha(15);
    Firestore.instance.collection('Store').document(idStore).setData({
      'idStore': idStore,
      'uuid': uuid,
      'name': 'Chưa có',
      'imageStore':
      'https://firebasestorage.googleapis.com/v0/b/appdoan-53f1b.appspot.com/o/ramdom.jpg?alt=media&token=7a7cb060-5d38-4891-8dd2-58a8125f5dd8',
      'rating': 0,
      'numberPersonRating': 0,
      'subRating': 0,
      'postId': postId.toList(),
      'description': 'Chưa có mô tả',
      'chatReturn': 0
    });

    firestore.collection('User').document(uuid).updateData({
      'isStore':true
    });
    return idStore;
  }
  //Get User
  Future<void> getUserOnline(String uuid) async {
    DocumentSnapshot snapshot = await firestore.collection('User').document(uuid).get();
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
  //Get Chat User
  Future<void> getChatUser(String uuid) async{
    await firestore.collection('ChatUser').where('uuid', isEqualTo: uuid).getDocuments().then((value) => {
      chatUser =(value.documents != null) ? ChatUser.fromSnapshot(value.documents[0]) : null
    }
    );

    print("Get Store");
  }
  void addFavoritePost(Post post, String idUser){

    favoritePost.add(post);
    List<dynamic> favorite = new List();

    for (int i = 0 ; i< post.report.length ; i++ ){
      favorite.add(post.report[i]);
    }
    favorite.add(idUser);

    firestore.collection('Post').document(post.idPost).updateData({
      'report' : favorite
    });
    notifyListeners();
  }
  void removeFavoritePost(Post post,String idUser){
    favoritePost.remove(post);
    List<dynamic> _favorite = new List();

    for (int i = 0 ; i< post.report.length ; i++ ){
      _favorite.add(post.report[i]);
    }
    _favorite.remove(idUser);

    firestore.collection('Post').document(post.idPost).updateData({
      'report' : _favorite
    });
    notifyListeners();
  }
  //
}