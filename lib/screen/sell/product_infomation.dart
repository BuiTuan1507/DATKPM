import 'dart:io';
import 'dart:math' show Random;
import 'package:app_giao_do_an/route.dart';
import 'package:app_giao_do_an/screen/sell/contact_infomation.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:random_string/random_string.dart';

class ProductInfomation extends StatefulWidget {
  String selectType;
  String selectCategory;
  String statusProduct;

  ProductInfomation(
      {Key key, this.selectType, this.selectCategory, this.statusProduct})
      : super(key: key);

  @override
  _ProductInfomationState createState() => _ProductInfomationState();
}

class _ProductInfomationState extends State<ProductInfomation> {
  TextEditingController tittleProduct = TextEditingController();
  TextEditingController addressProduct = TextEditingController();
  TextEditingController priceProduct = TextEditingController();
  TextEditingController descriptionProduct = TextEditingController();
  String tittleP;

  String addressP;

  String description;

  int price;

  List<Asset> imageProduct = <Asset>[];
  String _error = 'No Error Dectected';

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(

        maxImages: 3,
        enableCamera: true,
        selectedAssets: imageProduct,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Chợ bách khoa",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      imageProduct = resultList;
      _error = error;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.statusProduct);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Thông tin sản phẩm',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            (imageProduct.length == 0)
                ? Container(
                    margin: EdgeInsets.all(20),
                    width: queryData.size.width,
                    height: queryData.size.height * 0.28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1, color: Colors.black45)),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            loadAssets();
                          },
                          child: Center(
                            child: Icon(
                              Icons.add_a_photo,
                              size: 40,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Tải hình ảnh của sản phẩm ở đây',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            '(Tối đa 3 hình ảnh)',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  )
                : Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10,bottom: 10),

                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: imageProduct.length,
                    itemBuilder: (BuildContext context, int index) =>
                    Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: AssetThumb(
                        asset: imageProduct[index],
                        width: 100,
                        height: 100,
                      ),
                    )
                        ),
              ),
            )
          ],
        ),
            Container(
              height: 6,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: Text(
                    'Tiêu đề sản phẩm',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Container(
              height: 45,
              width: queryData.size.width * 0.9,
              margin: EdgeInsets.only(right: 12),
              child: TextField(
                maxLines: 1,
                maxLength: 50,
                controller: tittleProduct,
                onChanged: (t) {
                  tittleP = t;
                },
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.only(right: 12, left: 12),
                  child: Text(
                    'Danh mục',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    widget.selectType,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Divider(
              indent: 12,
              endIndent: 24,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.only(right: 12, left: 12),
                  child: Text(
                    'Loại',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    widget.selectCategory,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: Text(
                    'Nơi giao dịch',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Container(
              height: 65,
              width: queryData.size.width * 0.9,
              margin: EdgeInsets.only(right: 12),
              child: TextField(
                maxLines: 2,
                maxLength: 100,
                controller: addressProduct,
                onChanged: (t) {
                  addressP = t;
                },
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.only(left: 12, right: 12, top: 6),
                  child: Text(
                    'Giá',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Container(
              height: 25,
              width: queryData.size.width * 0.9,
              margin: EdgeInsets.only(right: 12),
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                controller: priceProduct,
                onChanged: (t) {
                  price = int.parse(t);
                },
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Tình trạng',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    widget.statusProduct,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Divider(
              indent: 12,
              endIndent: 24,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: queryData.size.width * 0.6,
                  padding: EdgeInsets.only(left: 12, right: 12, top: 6),
                  child: Text(
                    'Mô tả',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Container(
              height: 75,
              width: queryData.size.width * 0.9,
              margin: EdgeInsets.only(right: 12),
              child: TextField(
                maxLines: 30,
                controller: descriptionProduct,
                onChanged: (t) {
                  description = t;
                },
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 50,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CONTACTINFOMATION, arguments: {
                    'idPost':randomAlpha(20),
                    'tittleP': tittleP,
                    'addressP': addressP,
                    'description': description,
                    'price': price,
                    'selectType': widget.selectType,
                    'selectCategory': widget.selectCategory,
                    'statusProduct': widget.statusProduct,
                    'imageProduct':imageProduct,

                  });
                },
                child: Container(
                    height: 50,
                    width: queryData.size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber),
                    child: Center(
                      child: Text('Thông tin liên lạc',
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white)),
                    ))),
          ],
        ),
      ),
    );
  }
}
