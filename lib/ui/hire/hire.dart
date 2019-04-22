import 'package:flutter/material.dart';
import 'package:flutter_note/utils/hx_kit.dart';

class Hire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hire'),
      ),
      body: Container(
        color: HXKit().randColor(),
      ),
    );
  }
}
