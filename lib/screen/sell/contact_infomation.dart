import 'dart:io';
import 'dart:typed_data';
import 'package:app_giao_do_an/model/item.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path/path.dart';
import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' show Random;

import 'package:random_string/random_string.dart';
class ContactInfomation extends StatefulWidget {
  String idPost;
  String tittleP;
  String addressP;
  String description;
  int price;
  String selectType;
  String selectCategory;
  String statusProduct;

  List<Asset> imageProduct;

  ContactInfomation({Key key, this.idPost,this.selectType, this.selectCategory,
    this.statusProduct,this.tittleP,this.addressP,this.description,this.price, this.imageProduct })
      : super(key: key);
  @override
  _ContactInfomationState createState() => _ContactInfomationState();
}

class _ContactInfomationState extends State<ContactInfomation> {
  int isPriority ;

  Future<List<String>> uploadFiles(List<Asset> _images, String idPost,BuildContext context) async {
    List<String> imagesUrls=[];
    imagesUrls = await Future.wait(_images.map((_image) => uploadFile(_image)));
    print(imagesUrls);


    Firestore firestore = Firestore.instance;
    firestore.collection('Post').document(idPost).updateData({
        'imageProduct':imagesUrls
    });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Thông báo'),
            content: Text('Bạn đã đăng tin thành công'),
            actions: [
              FlatButton(
                child: Text("Quay lại"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Xem"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    return imagesUrls;
  }

  Future<String> uploadFile(Asset _image) async {
    ByteData byteData = await _image.getByteData(); // requestOriginal is being deprecated
    List<int> imageData = byteData.buffer.asUint8List();
    StorageReference ref = FirebaseStorage().ref().child('postProduct${_image.name}'); // To be aligned with the latest firebase API(4.0)
    StorageUploadTask uploadTask = ref.putData(imageData);

    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }
  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Consumer<ProviderController>(builder: (context,provider,child){
      User _userOnline = provider.userOnline;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Đăng tin bán', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height:30,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: queryData.size.width*0.6,
                    padding: EdgeInsets.only(right: 12,left: 12),
                    child: Text('Tên',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: queryData.size.width*0.6,
                    padding: EdgeInsets.all(12),
                    child: Text(_userOnline.name,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                  ),
                ],
              ),
              Divider(
                indent: 12,
                endIndent: 12,
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: queryData.size.width*0.6,
                    padding: EdgeInsets.only(right: 12,left: 12),
                    child: Text('Số điện thoại',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: queryData.size.width*0.6,
                    padding: EdgeInsets.all(12),
                    child: Text(_userOnline.phoneNumber,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                  ),
                ],
              ),
              Divider(
                indent: 12,
                endIndent: 12,
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: queryData.size.width*0.6,
                    padding: EdgeInsets.only(right: 12,left: 12),
                    child: Text('Email',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: queryData.size.width*0.6,
                    padding: EdgeInsets.all(12),
                    child: Text(_userOnline.email,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                  ),
                ],
              ),
              Divider(
                indent: 12,
                endIndent: 12,
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: queryData.size.width*0.6,
                    padding: EdgeInsets.only(right: 12,left: 12),
                    child: Text('Địa chỉ',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),),
                  ),
                ],
              ),
              InkWell(
                onTap: (){},
                child: Container(
                    padding: EdgeInsets.all(12),
                    child:Text('Cập nhật lại địa chỉ của bạn', style:TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.blue))

                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: queryData.size.width*0.6,
                    padding: EdgeInsets.all(12),
                    child: Text(_userOnline.address,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                  ),
                ],
              ),
              Divider(
                indent: 12,
                endIndent: 12,
                thickness: 1,
                color: Colors.grey,
              ),
              Container(height: 15,),
              Container(
                width: queryData.size.width,
                padding:
                EdgeInsets.only(top: 10, bottom: 5, left: 15),
                child: Text(
                  'Độ ưu tiên của bài đăng',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              ListTile(
                title: const Text('Không ưu tiên'),
                leading: Radio(
                  value: 0,
                  groupValue: isPriority,
                  onChanged: (value) {
                    setState(() {
                      isPriority = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Có ưu tiên'),
                leading: Radio(
                  value: 1,
                  groupValue: isPriority,
                  onChanged: (value) {
                    setState(() {
                      isPriority = value;
                    });
                  },
                ),
              ),
              Container(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    List<dynamic> imageP = List<dynamic>();
                    List<dynamic> report = List<dynamic>();
                    String idItem  = randomAlpha(15);

                    Item item = new Item(idItem,widget.tittleP,imageP.toList(),widget.price,widget.selectType,widget.selectCategory,widget.statusProduct,widget.description,false);

                    Post post = new Post(widget.idPost,_userOnline.uuid,_userOnline.name,_userOnline.email,_userOnline.phoneNumber,widget.addressP,DateTime.now(),item,report.toList(),isPriority);
                    provider.addPost(post);
                    uploadFiles(widget.imageProduct, widget.idPost,context);
                  },
                  child: Container(
                      height: 50,
                      width: queryData.size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber
                      ),
                      child: Center(
                        child: Text('Đăng tin',
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white)),
                      )

                  )
              ),
            ],
          ),
        ),
      );
    });

  }
}
