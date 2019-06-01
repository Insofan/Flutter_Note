import 'package:flutter/material.dart';
import 'package:flutter_note/common/ui_layout_type.dart';

class UIRowColPage extends StatefulWidget {
  UIRowColPage({Key key}) : super(key: key);

  _UIRowColPageState createState() => new _UIRowColPageState();
}

class _UIRowColPageState extends State<UIRowColPage> {
  bool _isRow = true;
  MainAxisSize _mainAxisSize = MainAxisSize.min;

  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;

  void _setState(int idx) {
    setState(() {
      _isRow = idx == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.filter_1),
        title: Text("Row / Col"),
        elevation: 1.0,
        bottom: PreferredSize(
            preferredSize: Size(0.0, 160.0)),
      ),
      body: Text('Row / Col')
    );
  }
}
