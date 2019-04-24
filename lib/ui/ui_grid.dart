import 'package:flutter/material.dart';

import 'package:flutter_note/utils/hx_kit.dart';

import 'package:flutter_note/ui/hire/hire.dart';
import 'package:flutter_note/ui/count/count.dart';
import 'package:flutter_note/ui/login/login.dart';

class UIGrid extends StatelessWidget {
  final List<String> _itemList = [
      "Hire",
      "Login",
      "Bloc Count"
  ];

  final Map<String, Widget> _widgetMap = {
    "Hire": Hire(),
    "Bloc Count": BlocCount(),
    "Login": Login(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI'),
      ),
      body: SafeArea(
        child: Container(
          color: HXKit().randColor(),
          child: GridView.count(
              padding: EdgeInsets.all(24.0),
              mainAxisSpacing: HXKit.mainSpace,
              crossAxisSpacing: HXKit.crossSpace,
              crossAxisCount: HXKit.crossCount,
              children: _itemList.map((String title) {
                return _buildChildren(context, title);
              }).toList()
          ),
        ),
      ),
    );
  }

  Widget _buildChildren(BuildContext context, String title) {
    return new RaisedButton(
      child: Text(title),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _widgetMap[title],
          ),
        );
      },
    );
  }
}

