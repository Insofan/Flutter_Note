import 'package:flutter/material.dart';

import 'package:flutter_note/utils/hx_kit.dart';

import 'package:flutter_note/practice/douba_movie/pages/db_top_250_page.dart';
import 'package:flutter_note/practice/douba_movie/pages/db_favourite_page.dart';
import 'package:flutter_note/practice/douba_movie/pages/db_explore_page.dart';

class DBMovieHome extends StatelessWidget {
  final List<String> _itemList = [
    "Top250",
    "我的最爱",
    "发现",
  ];

  final Map<String, Widget> _widgetMap = {
    "Top250": DBTop250(),
//    "我的最爱",
//    "发现",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('豆瓣电影'),
      ),
      body: SafeArea(
        child: Container(
            color: HXKit().randColor(),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.0),
              itemBuilder: (BuildContext context, int index) {
                return _selectorCard(context, index);
              },
              itemCount: 3,
            )),
      ),
    );
  }

  Widget _selectorCard(BuildContext context, int index) {
    return InkWell(
        key: Key('item_$index'),
        onTap: () {
          Navigator
              .of(context)
              .push(MaterialPageRoute(
              builder: (BuildContext context) {
                return _widgetMap[_itemList[index]];
              }
          )
          );
        },
        child: Card(
            elevation: 1,
            color: HXKit().randColor(),
            child: Center(
                child: Text('${_itemList[index]}')
            )
        )
    );
  }
}
