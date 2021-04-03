import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class ElectronicCatalog extends StatefulWidget {

  @override
  _ElectronicCatalogState createState() => _ElectronicCatalogState();
}

class _ElectronicCatalogState extends State<ElectronicCatalog> {
  int catalogF = 7;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Chọn danh mục', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(

              leading: Radio(
                value: 0,
                groupValue: catalogF,
                onChanged: (value) {
                  setState(() {
                    catalogF = value;
                  });
                },
              ),
              title: const Text('Tất cả đồ điện tử',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

            ),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            ListTile(

              leading: Radio(
                value: 1,
                groupValue: catalogF,
                onChanged: (value) {
                  setState(() {
                    catalogF = value;
                  });
                },
              ),
              title: const Text('Điện thoại',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

            ),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            ListTile(

              leading: Radio(
                value: 2,
                groupValue: catalogF,
                onChanged: (value) {
                  setState(() {
                    catalogF = value;
                  });
                },
              ),
              title: const Text('Máy tính bảng',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

            ),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            ListTile(

              leading: Radio(
                value: 3,
                groupValue: catalogF,
                onChanged: (value) {
                  setState(() {
                    catalogF = value;
                  });
                },
              ),
              title: const Text('Lap top',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

            ),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            ListTile(

              leading: Radio(
                value: 4,
                groupValue: catalogF,
                onChanged: (value) {
                  setState(() {
                    catalogF = value;
                  });
                },
              ),
              title: const Text('Máy tính để bàn',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

            ),
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            ListTile(

              leading: Radio(
                value: 5,
                groupValue: catalogF,
                onChanged: (value) {
                  setState(() {
                    catalogF = value;
                  });
                },
              ),
              title: const Text('Phụ kiện',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

            ),
            Container(height: 40,),
            InkWell(
                onTap: (){
                  if(catalogF != 7){
                    Navigator.pushNamed(context, PRODUCTTYPE,arguments: {'catalogF':catalogF,'costSearch':0});
                  }

                },
                child: Container(
                    height: 50,
                    width: queryData.size.width*0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber
                    ),
                    child: Center(
                      child: Text('Tìm kiếm',
                          style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                    )

                )
            ),



          ],

        ),
      ),
    );
  }
}
