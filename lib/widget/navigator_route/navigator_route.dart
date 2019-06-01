import 'package:flutter/material.dart';
import 'package:flutter_note/utils/hx_kit.dart';
import 'package:flutter_note/widget/navigator_route/nav_page_two.dart';


class NavRou extends StatefulWidget {
  NavRou() : super();
  @override
  _NavRouState createState() => _NavRouState();
}

class _NavRouState extends State<NavRou> {
  String testData = "Waiting call back";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Container(
        color: HXKit().randColor(),
        child: Center(
          child: Text(this.testData),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.hearing)
          , onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder:
            (context) {
          return Page2(testData: 'Page 1 pass value');
        })).then((value) {
          this.testData = value;
        });
      }),
    );
  }
}
