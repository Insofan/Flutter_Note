import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_note/Widget/WidgetListView.dart';
import 'package:flutter_note/Network/NetworkListView.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter笔记',
      theme: new ThemeData(primaryColor: Colors.purpleAccent),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter笔记'),
        ),
      body: new ItemList(),
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
    'Network'
  ];

  final Map<String, Widget> widgetMap = {
    'Widget': WidgetListView(),
    'Network': NetworkListView(),
  };

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
