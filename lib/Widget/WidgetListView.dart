import 'package:flutter/material.dart';
//class WidgetListView extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return null;
//  }
//}

class WidgetListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Widget List'),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}