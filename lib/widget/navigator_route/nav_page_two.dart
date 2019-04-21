import 'package:flutter/material.dart';
import 'package:flutter_note/utils/hx_kit.dart';

class Page2 extends StatefulWidget {
  String testData = '';
  Page2({Key key, @required this.testData}) : super(key: key);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Container(
        color: HXKit().randColor(),
        child: Center(
            child: Text(this.widget.testData, style: TextStyle(color: Colors.white),)),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.access_alarm)
          , onPressed: () {
        Navigator.pop(context, 'Page 2 call back value');
      }),
    );
  }
}
