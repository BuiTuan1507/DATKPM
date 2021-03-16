import 'package:app_giao_do_an/constant.dart';
import 'package:app_giao_do_an/model/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ItemElectronicDetail extends StatefulWidget {
  @override
  _ItemElectronicDetailState createState() => _ItemElectronicDetailState();
}

class _ItemElectronicDetailState extends State<ItemElectronicDetail> {

  Item item1 = new Item('1','nha xa',['assets/h1.jpg'],2000000,'Ha noi','hêlo','hello','hee',true);
  String _formatMoney(int costSearch){
    if((costSearch>1000) && (costSearch<1000000)){
      costSearch = (costSearch/1000) as int;
      return costSearch.toString() +'.000';
    }
    if((costSearch>=1000000) && (costSearch < 1000000000)){
      costSearch = (costSearch~/1000000) ;
      return costSearch.toString() + '.000'+'.000';
    }
    else return '1';
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.favorite_border,color: Colors.black45,size: 28,),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert,color: Colors.black45,size: 28,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.only(
                        left: kDefaultPadding,
                        top: kDefaultPadding / 2,
                        bottom: kDefaultPadding / 2,
                      ),
                      width: queryData.size.width * 0.8,
                      height: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/h1.jpg'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.only(
                        left: kDefaultPadding,
                        top: kDefaultPadding / 2,
                        bottom: kDefaultPadding / 2,
                      ),
                      width: queryData.size.width * 0.8,
                      height: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/h2.jpg'),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.only(
                        left: kDefaultPadding,
                        top: kDefaultPadding / 2,
                        bottom: kDefaultPadding / 2,
                      ),
                      width: queryData.size.width * 0.8,
                      height: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/h2.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15,top: 12,right: 12,bottom: 12),
                child: Text(item1.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 150,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15,bottom: 12),
                      child: Text(_formatMoney(item1.cost) + ' đ',style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500,color: Colors.red),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15,bottom: 12),
                      child: Text('6 giờ trước', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey[500])),
                    )
                  ],
                ),
              ),
              Container(
                width: queryData.size.width*0.3,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1, color: Colors.red)
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding:EdgeInsets.only(right: 10),
                      child: Text('Lưu tin', style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400, color: Colors.red),),
                    ),
                    Container(
                      child: Icon(Icons.favorite_border,size: 25,color: Colors.red,),
                    )
                  ],
                ),
              )
            ],
          ),
            Container(height: 2,),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(

              children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(12),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/ramdom.jpg'),
                      radius: 25,
                    ),
                  ),
                SizedBox(
                  width: queryData.size.width*0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 6,right: 10),
                        child: Text(
                          'Cửa hàng điện thoại bán đồ dởm ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.left,
                        ),
                      ),
                      Container(

                        alignment: Alignment.centerLeft,
                        child: Text('Hoạt động' + ' 1 ' + 'giờ trước',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.grey[400]),),
                      )
                    ],
                  ),
                ),


                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.amber),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text('Xem trang',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,color: Colors.amber),),
                    ),
                  ),
                )

              ],
            ),
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 50,top: 12,bottom: 6,right: 50),
                        child: Text('Cửa hàng',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, ),),
                      ),
                      Container(
                        child: Icon(Icons.business_center,size: 28,),
                      )
                    ],
                  ),
                  VerticalDivider(
                    indent: 20,
                    thickness: 2,
                    color: Colors.grey[500],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 50,top: 12,bottom: 6,right: 50),
                        child: Text('Đánh giá',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, )),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text('4.0 ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.red )),
                          ),
                          Container(
                            child: Icon(Icons.star,size:28,color: Colors.amber,),
                          ),
                          Container(
                            child: Text(' (321)',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, )),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(height: 10,),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(top: 12,left: 12,right: 12,bottom: 12),
                    child: Text('Chuyên bán đồ rởm, đồ kém chất lượng, hàng Trung quốc kém chất lượng. Ai có nhu cầu mua xin liên hệ 09xx.xxx.xxx'
                      ,style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.fade,textAlign: TextAlign.left,),
                  ),
                )

              ],
            ),
            Container(height: 10,),
            Divider(

              thickness: 1,
              color: Colors.grey[400],
            ),
            Container(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Thông tin sản phẩm',style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey[400]) ,),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15,top: 15,bottom: 10,right: 12),
                  child: Text('Điện thoại IP 12, máy mới dùng 1 tháng, còn nguyên bảo hành, các thiết bị'
                      ,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                ),
              ],
            ),
            Divider(

              thickness: 1,
              color: Colors.grey[400],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Text('Khu vực' ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey[400]),),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  child: Icon(Icons.location_on,size: 28,),
                ),
                Flexible(
                  child: Container(
                    child: Text('Phường Mai Động, Quận Hoàng Mai, Hà Nội', style:TextStyle(fontSize: 19, fontWeight: FontWeight.w400, color:Colors.black45)),
                  ),
                )

              ],
            ),
            Container(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: RichText(
                text:  TextSpan(
                    style: TextStyle(fontSize: 17,color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: 'Tin đăng đã được kiểm duyệt . Nếu gặp bất cứ vấn đề gì, xin vui lòng liên hệ'),
                      TextSpan(text: ' 0922121212',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 21,color: Colors.blue),),
                    ]

                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
}
