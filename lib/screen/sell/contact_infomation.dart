import 'dart:io';
import 'dart:typed_data';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path/path.dart';
import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ContactInfomation extends StatefulWidget {
  String tittleP;
  String addressP;
  String description;
  int price;
  String selectType;
  String selectCategory;
  String statusProduct;
  List<Asset> imageProduct;
  ContactInfomation({Key key, this.selectType, this.selectCategory,
    this.statusProduct,this.tittleP,this.addressP,this.description,this.price, this.imageProduct})
      : super(key: key);
  @override
  _ContactInfomationState createState() => _ContactInfomationState();
}

class _ContactInfomationState extends State<ContactInfomation> {
  String nameUser = 'tuan';
  String phoneNumber = '0923121212';
  String emailUser = 'abc@gmail.com';
  String address = 'Số 1, Mai Động, Hà Nội';
  Future<List<String>> uploadFiles(List<Asset> _images) async {
    List<String> imagesUrls=[];
    imagesUrls = await Future.wait(_images.map((_image) => uploadFile(_image)));
    print(imagesUrls);
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
                    child: Text(nameUser,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
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
                    child: Text(phoneNumber,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
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
                    child: Text(emailUser,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
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
                    child: Text(address,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                  ),
                ],
              ),
              Divider(
                indent: 12,
                endIndent: 12,
                thickness: 1,
                color: Colors.grey,
              ),
              Container(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    uploadFiles(widget.imageProduct);
                  //  provider.addPost(widget.tittleP, widget.addressP, widget.description,
                   //     widget.price, widget.selectType, widget.selectCategory, widget.statusProduct, nameUser, phoneNumber, emailUser, address);
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
