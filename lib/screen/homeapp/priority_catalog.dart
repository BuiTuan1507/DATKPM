import 'package:flutter/material.dart';

import '../../route.dart';
class PriorityCatalog extends StatefulWidget {
  @override
  _PriorityCatalogState createState() => _PriorityCatalogState();
}

class _PriorityCatalogState extends State<PriorityCatalog> {
  int priorityF;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Chọn ưu tiên', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
      body: Column(
        children: <Widget>[
          ListTile(

            leading: Radio(
              value: 0,
              groupValue: priorityF,
              onChanged: (value) {
                setState(() {
                  priorityF = value;
                });
              },
            ),
            title: const Text('Tất cả ',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

          ),
          Divider(
            thickness: 1,
            color: Colors.grey[400],
          ),
          ListTile(

            leading: Radio(
              value: 1,
              groupValue: priorityF,
              onChanged: (value) {
                setState(() {
                  priorityF = value;
                });
              },
            ),
            title: const Text('Ưu tiên',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

          ),
          Divider(
            thickness: 1,
            color: Colors.grey[400],
          ),
          ListTile(

            leading: Radio(
              value: 2,
              groupValue: priorityF,
              onChanged: (value) {
                setState(() {
                  priorityF = value;
                });
              },
            ),
            title: const Text('Không ưu tiên',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

          ),
          Container(height: 40,),
          InkWell(
              onTap: (){
                Navigator.pushNamed(context, PRODUCTTYPE,arguments: {'catalogF': 0,'costSearch':0,'priority':priorityF});
              },
              child: Container(
                  height: 50,
                  width: 120,
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
    );
  }
}
