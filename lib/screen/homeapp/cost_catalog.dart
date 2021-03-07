import 'package:flutter/material.dart';
class CostCatalog extends StatefulWidget {

  @override
  _CostCatalogState createState() => _CostCatalogState();
}

class _CostCatalogState extends State<CostCatalog> {
  double costSearch = 1.1;
  String _formatMoney(int costSearch){
    if(costSearch<=10){
      costSearch = costSearch*100;
      return costSearch.toString() +',000';
    }
    if(costSearch>=10){
      int a = (costSearch ~/ 10) ;
      int b = costSearch % 10;
      return a.toString() + ','+ b.toString() + '00'+',000';
    }
    else return '1';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Chọn danh mục', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
          ),
          Container(
            child: Slider(
              value: costSearch,
              onChanged: (newCostSearch){
                setState(() {
                  costSearch = newCostSearch;
                });
              },
              min: 1,
              max: 200,
              //divisions: 5,
              //label: '$costSearch',
            ),
          ),
          Container(
            child: Text('${_formatMoney(costSearch.round())}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
          )
        ],
      ),
    );
  }
}
