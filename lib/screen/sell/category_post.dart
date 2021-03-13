import 'package:flutter/material.dart';

class CategoryPost extends StatefulWidget {
  int selectedType;
  CategoryPost({Key key, this.selectedType})
      : super(key: key);
  @override
  _CategoryPostState createState() => _CategoryPostState();
}

class _CategoryPostState extends State<CategoryPost> {
  var selectCategory = [];
  var _categoryHome = ['Chung cư', 'Phòng trọ', 'Homestay'];
  var _categoryVehicle = ['Xe cộ', 'Xe máy', 'Xe điện', 'Xe đạp', 'Phụ kiện'];
  var _categoryElectronic = [
    'Đồ điện tử',
    'Điện thoại',
    'Máy tính bảng',
    'Lap top',
    'Máy tính để bàn',
    'Phụ kiện'
  ];
  var _categoryAnimal = ['Chó', 'Mèo', 'Đồ ăn', 'Vật phẩm'];
  var _categoryHouseware = ['Bàn, ghế', 'Bếp'];
  var _categoryFood = ['Đồ ăn vặt', 'Tạp hóa', 'Ngũ cốc', 'Mì gói'];
  var _categoryJob = ['Part time', 'Full time'];
  var _categoryBook = ['Giáo trình','Sách kinh điển','Văn phòng phẩm'];
  @override
  void initState() {
    switch(widget.selectedType){
      case 1:
        selectCategory = _categoryHome;
        break;
      case 2:
        selectCategory = _categoryVehicle;
        break;
      case 3 :
        selectCategory = _categoryAnimal;
        break;
      case 4:
        selectCategory = _categoryElectronic;
        break;
      case 5:
        selectCategory = _categoryFood;
        break;
      case 6:
        selectCategory = _categoryHouseware;
        break;
      case 7 :
        selectCategory = _categoryJob;
        break;
      case 8:
        selectCategory = _categoryBook;
        break;
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Chọn loại ',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: selectCategory.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    child:Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[

                            Container(
                              width: queryData.size.width*0.85,
                              padding: EdgeInsets.only(top: 10,bottom: 7),
                              child: Text(selectCategory[index],style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                            ),
                            InkWell(
                              child: Container(

                                child: Icon(Icons.arrow_forward_ios, size: 24,color: Colors.black45,),
                              ),
                            )
                          ],
                        ),

                        Divider(
                          endIndent: 5,
                          indent: 5,
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ],
                    )
                  );
                })
          ],
        ),
      ),
    );
  }
}
