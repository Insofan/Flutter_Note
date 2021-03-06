import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_note/utils/hx_kit.dart';
import 'package:elite_kit/elite_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_note/net/net_dio_util.dart';
import 'package:flutter_note/net/net_url_path.dart';

import 'package:flutter_note/widget/widget_list.dart';
import 'package:flutter_note/pages/ui/ui_grid_page.dart';

import 'package:flutter_note/widget/navigator_route/navigator_route.dart';
import 'package:flutter_note/widget/navigator_route/nav_page_two.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter笔记',
      theme: new ThemeData(primaryColor: HXKit().randColor()),
      routes: {
        '/nav': (context) {return NavRou();},
        '/page2': (context) {return Page2();},
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter笔记'),
        ),
        // 苹果的Safe Area
        body: SafeArea(
          child: new ItemList(),
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ItemListState();
}

class ItemListState extends State<ItemList> {
  final List<String> titleList = [
    'Widget',
    'UI',
  ];

  final Map<String, Widget> widgetMap = {
    'Widget': WidgetList(),
    'UI': UIGrid(),
  };

  @override
  void initState() {
    super.initState();
    _initDioUtil();
  }

  /// 初始化网络请求
  void _initDioUtil() {
    BaseOptions baseOptions = DioUtil.getDefOptions();
    baseOptions.baseUrl = API.baseUrl;
    HttpConfig config = new HttpConfig(options: baseOptions);
    DioUtil().setConfig(config);
  }

  /// 初始化elite
  void _initElite() {
    ScreenKit.init(designW: 375, designH: 667, ableFontScale: true);
  }
  @override
  Widget build(BuildContext context) {
    return new ListView.separated(
      itemCount: titleList.length,
      padding: const EdgeInsets.all(6.0),
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(context, titleList[i]);
      },
      separatorBuilder: (BuildContext context, int i) {
        return new Divider(color: Colors.grey);
      },
    );
  }

  Widget _buildRow(BuildContext context, String title) {
    return ListTile(
      title: new Text(
        title,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widgetMap[title])
        );
      },
    );
  }
}
