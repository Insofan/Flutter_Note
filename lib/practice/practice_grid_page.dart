import 'package:flutter/material.dart';

import 'package:flutter_note/utils/hx_kit.dart';

import 'package:flutter_note/practice/count/count.dart';
import 'package:flutter_note/practice/douba_movie/db_movie_home_page.dart';

class PracticeGrid extends StatelessWidget {
  final List<String> _itemList = [
    "Bloc Count",
    "Douban Movie",
  ];

  final Map<String, Widget> _widgetMap = {
    "Bloc Count": BlocCount(),
    "Douban Movie": DBMovieHome(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice'),
      ),
      body: SafeArea(
        child: Container(
          color: HXKit().randColor(),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0
            ),
            itemBuilder: (BuildContext context, int index) {
              return _buildChildren(context, _itemList[index]);
            },
            itemCount: _itemList.length,
          ),
        ),
      ),
    );
  }

  Widget _buildChildren(BuildContext context, String title) {
    return new RaisedButton(
      color: HXKit().randColor(),
      child: Text(title),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _widgetMap[title],
          ),
        );
      },
    );
  }
}