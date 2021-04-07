import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_giao_do_an/route.dart';
class AllChat extends StatefulWidget {
  @override
  _AllChatState createState() => _AllChatState();
}

class _AllChatState extends State<AllChat> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, CHATITEM);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: AssetImage('assets/h1.jpg'),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: Container(
                            width: 65,
                            height: 65,
                            padding: EdgeInsets.all(2),

                            alignment: Alignment.topRight,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width:1.5,color: Colors.white)
                              ),
                              child: Image.asset('assets/online.jpg',),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: queryData.size.width*0.45,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('ACE STORE DO', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,),
                                ),
                                Container(
                                  child: Text('5 ' + 'ngay', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),),
                                )
                              ],
                            ),
                            Container(
                              width: queryData.size.width*0.5,

                              padding: EdgeInsets.only(top: 12),
                              child: Text('Iphone 12xMax 32GB', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color:Colors.grey),overflow: TextOverflow.ellipsis,),
                            )
                          ],
                        ),
                        Container(
                          width: 80,
                          height: 60,
                          padding: EdgeInsets.only(left: 12),
                          child: Image.asset('assets/h1.jpg',fit: BoxFit.cover,),
                        )

                      ],
                    ),
                  ),
                )
                  ;
              },
            )
          ],
        ),
      ),
    );
  }
}
