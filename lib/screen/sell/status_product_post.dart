import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class StatusProductPost extends StatefulWidget {
  String selectType;
  String selectCategory;
  StatusProductPost({Key key, this.selectType, this.selectCategory})
      : super(key: key);
  @override
  _StatusProductPostState createState() => _StatusProductPostState();
}

class _StatusProductPostState extends State<StatusProductPost> {
  String statusProduct ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Trạng thái sản phẩm',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          ListTile(

            leading: Radio(
              value: 'Còn mới',
              groupValue: statusProduct,
              onChanged: (value) {
                setState(() {
                  statusProduct = value;
                });
              },
            ),
            title: const Text('Còn mới ',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

          ),
          Divider(
            thickness: 1,
            color: Colors.grey[400],
          ),
          ListTile(

            leading: Radio(
              value: 'Đã cũ',
              groupValue: statusProduct,
              onChanged: (value) {
                setState(() {
                  statusProduct = value;
                });
              },
            ),
            title: const Text('Đã cũ',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400 ),),

          ),

          Container(height: 40,),
          InkWell(
              onTap: (){
                Navigator.pushNamed(context, ADDPOST,
                    arguments: {'selectedType':widget.selectType,'selectedCategory':widget.selectCategory,'statusProduct':statusProduct});
              },
              child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber
                  ),
                  child: Center(
                    child: Text('Tiếp theo',
                        style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  )

              )
          ),
        ],
      ),
    );
  }
}
