import 'package:flutter/material.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_widget.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_page_one.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_page_two.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_page_three.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_page_four.dart';


class TabBarTopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabBarTopPageState();
  }
}

class _TabBarTopPageState extends State<TabBarTopPage> {
  final PageController topPageControl = PageController();

  final List<String> tab = [
    "111",
    "222",
    "333",
    "444",
    "555",
    "666",
    "777",
    "888",
    "999",
    "1010",
    "1111",
    "1212",
    "1313",
    "1414",
    "1515",
    "1616"
  ];

  List<Widget> _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(
          FlatButton(
              onPressed: () {
                topPageControl.jumpTo(
                    MediaQuery
                        .of(context)
                        .size
                        .width * i
                );
              },
              child: Text(
                tab[i],
                maxLines: 1,
              ))
      );
    }
    return list;
  }


  List<Widget> _renderPage() {
    return [
      TabBarPageOne(),
      TabBarPageTwo(),
      TabBarPageThree(),
      TabBarPageFour(),

      TabBarPageOne(),
      TabBarPageTwo(),
      TabBarPageThree(),
      TabBarPageFour(),

      TabBarPageOne(),
      TabBarPageTwo(),
      TabBarPageThree(),
      TabBarPageFour(),

      TabBarPageOne(),
      TabBarPageTwo(),
      TabBarPageThree(),
      TabBarPageFour(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TabBarWidget(
      type: TabBarWidget.kTopTab,
      tabItems: _renderTab(),
      tabViews: _renderPage(),
      topPageControl: topPageControl,
      backgroundColor: Colors.lightBlue,
      indicatorColor: Colors.white,
      title: Text("Top Tab Bar"),
    );
  }
}