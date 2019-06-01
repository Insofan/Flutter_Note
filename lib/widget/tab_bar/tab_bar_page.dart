import 'package:flutter/material.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_top_page.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_bottom_page.dart';

class TabBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBarPageState();
  }
}

class _TabBarPageState extends State<TabBarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab bar"),
      ),
      body: Row(
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarTopPage()));
            },
            child: Text("Top tab"),
          ),
           FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarBottomPage()));
            },
            child: Text("Bottom tab"),
          ),
        ],
      ),
    );
  }
}
