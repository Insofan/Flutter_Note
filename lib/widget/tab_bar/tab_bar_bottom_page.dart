import 'package:flutter/material.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_widget.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_page_one.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_page_two.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_page_three.dart';
import 'package:flutter_note/widget/tab_bar/tab_bar_page_four.dart';

class TabBarBottomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabBarBottomPageState();
  }
}

class _TabBarBottomPageState extends State<TabBarBottomPage> {
  final PageController pageControl = PageController();
  final List<String> tab = ["论坛", "菠菜", "我的"];

  List<Widget> _renderTab() {
    /*
      tab.forEach((str) =>
      {
        list.add(FlatButton(onPressed: () {
          pageControl.jumpTo(
              MediaQuery
                  .of(context)
                  .size
                  .width * i;
          );
        },
            child: Text(
              tab[i++],
              maxLines: 1,
            )))
      });
      return list;
      */

    List<Widget> list = List();
    for (int i = 0; i < tab.length; i++) {
      list.add(new FlatButton(
          onPressed: () {
            pageControl.jumpTo(MediaQuery.of(context).size.width * i);
          },
          child: new Text(
            tab[i],
            maxLines: 1,
          )));
    }
    return list;
  }
  _renderPage() {
    return [
      TabBarPageOne(),
      TabBarPageTwo(),
      TabBarPageThree(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
        type: TabBarWidget.kBottomTab,
        ///渲染tab
        tabItems: _renderTab(),
        ///渲染页面
        tabViews: _renderPage(),
        topPageControl: pageControl,
        backgroundColor: Colors.black45,
        indicatorColor: Colors.white,
        title: new Text("Bottom Tab"));
  }
}
