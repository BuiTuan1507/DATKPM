import 'package:app_giao_do_an/model/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Search extends StatefulWidget {
  String searchPost;
  Search({Key key, this.searchPost}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchPostState;
  @override
  void initState() {
    if (widget.searchPost != null){
      searchPostState = widget.searchPost;
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Post> _searchPost = [];
    List<Post> x = Provider.of<List<Post>>(context);
    if (searchPostState  != null){

    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Tìm kiếm', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 150,),
            Center(
              child: Text('Tìm kiếm thông tin'),
            )
          ],
        ),
      ),
    );
  }
}
