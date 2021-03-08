import 'package:app_giao_do_an/constant.dart';
import 'package:app_giao_do_an/model/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ItemElectronicDetail extends StatefulWidget {
  @override
  _ItemElectronicDetailState createState() => _ItemElectronicDetailState();
}

class _ItemElectronicDetailState extends State<ItemElectronicDetail> {

  Item item1 = new Item('1','IPhone 12x 32GB','assets/h1.jpg',20000000,'Hoàng Mai, Hà Nội',true);
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
            Container(height: 15,),
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
                      radius: 20,
                    ),
                  )
              ],
            )
          ],

        ),
      ),
    );
  }
}
