import 'package:app_giao_do_an/controller/provider_controller.dart';
import 'package:app_giao_do_an/model/post.dart';
import 'package:app_giao_do_an/screen/sell/contact_infomation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ActivityUser extends StatefulWidget {
  @override
  _ActivityUserState createState() => _ActivityUserState();
}

class _ActivityUserState extends State<ActivityUser> {
  static const defaultImageString =
      "https://firebasestorage.googleapis.com/v0/b/appdoan-53f1b.appspot.com/o/ramdom.jpg?alt=media&token=07e2217a-dd59-4eee-86ba-29b13a688d69";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProviderController>(builder: (context,provider,child){
      List<Post> userFavorite = provider.cartPost;
      return Scaffold(

          body: (userFavorite != null)
              ?
          SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  ListView.builder(


                    shrinkWrap: true,
                    //itemCount: cart.FavoriteItem.length,
                    itemCount: userFavorite.length,
                    itemBuilder: (BuildContext context, i) {

                      var favoriteList = userFavorite;
                      return new Container(
                        height: 100,
                        padding: EdgeInsets.only(left: 20,top: 5,bottom: 5,right: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.orange)
                          ),
                          color: Colors.white,
                          child: Stack(
                            children: <Widget>[
                              Container (
                                  padding:EdgeInsets.only(left: 10,right: 15, top:4, bottom: 4),
                                  child: InkWell(
                                    onTap: () {


                                    },
                                    child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:(favoriteList[i].item.image != null) ? NetworkImage(favoriteList[i].item.image[0]) : NetworkImage(defaultImageString),
                                                fit: BoxFit.fill))
                                    ),
                                  )),
                              Positioned(
                                top:10,
                                bottom: 10,
                                left: size.width*0.35,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Center(
                                            child: Text(favoriteList[i].item.name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.amber),
                                            )
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container (
                                          padding :EdgeInsets.only(bottom: 0),
                                          child: Text('\$${favoriteList[i].item.cost} đ', style: TextStyle(fontSize: 15, color: Colors.black),
                                          )
                                          ,)
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                              Positioned(
                                top: 12,
                                bottom: 12,
                                left: size.width*0.65,
                                child:  Container (
                                  child :IconButton(
                                    icon: Icon(Icons.delete,color: Colors.black,),
                                    onPressed: () {
                                      provider.removeCart(favoriteList[i]);
                                      // cart.deleteFavorite(favoriteList[i].idFavorite);
                                    },
                                  ),
                                ),
                              )


                            ],
                          ),
                        )
                        ,
                      );



                    },
                  ),
                  Container(height: 40,),
                  Center(
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: InkWell(

                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>MyCategoryPage(uid: cart.uid,)));
                          },
                          child: Center(
                            child: Text('Xem thêm sản phẩm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color:Colors.white),),
                          )

                      ),
                    ),
                  )

                ]),
          )
              : Column(
            children: <Widget>[
              Center (child :  Text ( "Giỏ hàng trống" ,style :  TextStyle (fontSize :  22 ),)),
              Container(height: 40,),
              Center(
                child: Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: InkWell(

                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>MyCategoryPage(uid: cart.uid,)));
                      },
                      child: Center(
                        child: Text('Xem thêm sản phẩm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color:Colors.white),),
                      )

                  ),
                ),
              )
            ],
          ));
    },
    );


  }
}
