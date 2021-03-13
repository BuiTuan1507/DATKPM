import 'package:flutter/material.dart';
class CategoryPost extends StatefulWidget {
  @override
  _CategoryPostState createState() => _CategoryPostState();
}

class _CategoryPostState extends State<CategoryPost> {
  var _categoryHome = ['Chung cư','Phòng trọ','Homestay'];
  var _categoryVehicle = ['Xe cộ','Xe máy','Xe điện', 'Xe đạp','Phụ kiện'];
  var _categoryElectronic = ['Đồ điện tử','Điện thoại','Máy tính bảng', 'Lap top', 'Máy tính để bàn', 'Phụ kiện'];
  var _categoryAnimal = ['Chó','Mèo','Đồ ăn','Vật phẩm'];
  var _categoryHouseware = ['Bàn, ghế', 'Bếp'];
  var _categoryFood = ['Đồ ăn vặt', 'Tạp hóa', 'Ngũ cốc','Mì gói'];
  var _categoryJob = ['Part time','Full time'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Chọn loại ', style: TextStyle(
            fontSize: 23, fontWeight: FontWeight.w500, color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
