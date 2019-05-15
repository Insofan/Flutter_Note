import 'package:flutter/material.dart';
import 'package:flutter_note/utils/hx_kit.dart';

class UILayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout"),
      ),
      body: SafeArea(
          child: Container(
        color: HXKit().randColor(),
      )),
    );
  }
}
