import 'package:flutter/material.dart';
import 'package:flutter_note/common/ui_layout_type.dart';

class UIStackPage extends StatefulWidget {
  UIStackPage({Key key}) : super(key: key);

  _UIStackPageState createState() => new _UIStackPageState();
}

class _UIStackPageState extends State<UIStackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Text('Stack'),
    );
  }
}
