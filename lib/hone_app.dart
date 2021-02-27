import 'package:app_giao_do_an/route.dart';
import 'package:flutter/material.dart';
class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _selectIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    switch (_selectIndex) {
      case 0:
        Navigator.pushNamed(context, ORDER);
        print(1);
        break;
      case 1:
        Navigator.pushNamed(context, ORDER);
        print(2);
        break;
      case 2:
        Navigator.pushNamed(context, ORDER);
        print(3);
        break;
      case 3:
        Navigator.pushNamed(context, ORDER);
        print(4);
        break;
      case 4:
        Navigator.pushNamed(context, ORDER);
        print(5);
        break;
    }
    setState(() {
      _selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Text("h",style: TextStyle(fontSize: 30),)
        ),
        bottomNavigationBar:  BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title:Text ('School'),
            ),
          ],
          currentIndex: _selectIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      )
    );

  }
}
